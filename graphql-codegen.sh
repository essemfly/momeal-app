#!/bin/bash
npx get-graphql-schema http://dev.mealkit.lessbutter.co/query > lib/graphql/schema.graphql
flutter pub run build_runner build