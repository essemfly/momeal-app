#!/bin/bash
npx get-graphql-schema https://mealkit.lessbutter.co/query > lib/graphql/schema.graphql
flutter pub run build_runner build --delete-conflicting-outputs