// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/catalog.dart';
import 'src/item_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Catalog>(
      create: (context) => Catalog(),
      child: const MaterialApp(
        title: 'Infinite List Sample',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite List Sample'),
      ),
      body: Selector<Catalog, int?>(
        selector: (context, catalog) => catalog.itemCount,
        builder: (context, itemCount, child) => ListView.builder(
          itemCount: itemCount,
          padding: const EdgeInsets.symmetric(vertical: 18),
          itemBuilder: (context, index) {

            var catalog = Provider.of<Catalog>(context);
            var item = catalog.getByIndex(index);

            if (item.isLoading) {
              return const LoadingItemTile();
            }

            return ItemTile(item: item);
          },
        ),
      ),
    );
  }
}
