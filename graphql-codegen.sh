#!/bin/bash
npx get-graphql-schema http://ec2-15-164-166-129.ap-northeast-2.compute.amazonaws.com:8080/query > lib/graphql/schema.graphql
flutter pub run build_runner build