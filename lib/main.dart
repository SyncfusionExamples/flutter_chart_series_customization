import 'package:flutter/material.dart';

import 'samples/boder_gradient.dart';
import 'samples/color_border.dart';
import 'samples/custom_series_renderer.dart';
import 'samples/customize_segment.dart';
import 'samples/gradient.dart';
import 'samples/point_color_mapper.dart';
import 'samples/point_shader_mapper.dart';
import 'samples/shader.dart';
import 'samples/shader_range_based.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late Map<String, Widget> _routes;
  late String _content;
  late ScrollController _scrollController;

  void _handlePageContentChange(String route) {
    setState(() {
      _content = route;
    });
  }

  @override
  void initState() {
    _routes = {
      'Color & Border Color': const ColorAndBorderSample(),
      'Point Color Mapper': const ColorMapperSample(),
      'Gradient': const FillGradientSample(),
      'Border Gradient': const BorderGradientSample(),
      'Shader': const ShaderSample(),
      'Point Shader Mapper': const PointShaderSample(),
      'Shader - Range Based': const RangeBasedShaderSample(),
      'Customize Segment': const CustomSegmentSample(),
      'Custom Series Rendering': const CustomSeriesSample(),
    };
    _content = 'Color & Border Color';
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Chart Series Customization')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: _routes[_content]!,
              ),
            ),
            Scrollbar(
              controller: _scrollController,
              child: SizedBox(
                height: 60,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(_routes.length, (int index) {
                      final String key = _routes.keys.elementAt(index);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: ActionChip(
                          label: Text(key),
                          labelPadding: const EdgeInsets.all(5.0),
                          backgroundColor:
                              _content == key ? themeData.primaryColor : null,
                          labelStyle: TextStyle(
                            color:
                                _content == key ? Colors.white : Colors.black,
                          ),
                          onPressed: () => _handlePageContentChange(key),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
