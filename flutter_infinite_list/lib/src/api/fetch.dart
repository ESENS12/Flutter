// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'item.dart';
import 'page.dart';

const catalogLength = 200;

/// This function emulates a REST API call. You can imagine replacing its
/// contents with an actual network call, keeping the signature the same.
///
/// It will fetch a page of items from [startingIndex].
Future<ItemPage> fetchPage(int startingIndex) async {

  await Future<void>.delayed(const Duration(milliseconds: 500));

  if (startingIndex > catalogLength) {
    return ItemPage(
      items: [],
      startingIndex: startingIndex,
      hasNext: false,
    );
  }

  return ItemPage(
    items: List.generate(
        itemsPerPage,
        (index) => Item(
              color: Colors.primaries[index % Colors.primaries.length],
              name: 'Color #${startingIndex + index}',
              price: 50 + (index * 42) % 200,
            )),
    startingIndex: startingIndex,
    hasNext: startingIndex + itemsPerPage < catalogLength,
  );
}
