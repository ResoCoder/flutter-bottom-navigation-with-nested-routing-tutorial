// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../home_page.dart' as _i3;
import '../posts/posts_page.dart' as _i5;
import '../posts/single_post_page.dart' as _i6;
import '../settings/settings_page.dart' as _i4;
import '../users/user_profile_page.dart' as _i8;
import '../users/users_page.dart' as _i7;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.HomePage();
        }),
    PostsRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    UsersRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    SettingsRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.SettingsPage();
        }),
    PostsRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args =
              data.argsAs<PostsRouteArgs>(orElse: () => const PostsRouteArgs());
          return _i5.PostsPage(key: args.key);
        }),
    SinglePostRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final pathParams = data.pathParams;
          final args = data.argsAs<SinglePostRouteArgs>(
              orElse: () =>
                  SinglePostRouteArgs(postId: pathParams.getInt('postId')));
          return _i6.SinglePostPage(key: args.key, postId: args.postId);
        }),
    UsersRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.UsersPage();
        }),
    UserProfileRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final pathParams = data.pathParams;
          final args = data.argsAs<UserProfileRouteArgs>(
              orElse: () =>
                  UserProfileRouteArgs(userId: pathParams.getInt('userId')));
          return _i8.UserProfilePage(key: args.key, userId: args.userId);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomeRoute.name, path: '/', children: [
          _i1.RouteConfig(PostsRouter.name, path: 'posts', children: [
            _i1.RouteConfig(PostsRoute.name, path: ''),
            _i1.RouteConfig(SinglePostRoute.name, path: ':postId')
          ]),
          _i1.RouteConfig(UsersRouter.name, path: 'users', children: [
            _i1.RouteConfig(UsersRoute.name, path: ''),
            _i1.RouteConfig(UserProfileRoute.name, path: ':userId')
          ]),
          _i1.RouteConfig(SettingsRouter.name, path: 'settings')
        ])
      ];
}

class HomeRoute extends _i1.PageRouteInfo<void> {
  const HomeRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

class PostsRouter extends _i1.PageRouteInfo<void> {
  const PostsRouter({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'posts', initialChildren: children);

  static const String name = 'PostsRouter';
}

class UsersRouter extends _i1.PageRouteInfo<void> {
  const UsersRouter({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'users', initialChildren: children);

  static const String name = 'UsersRouter';
}

class SettingsRouter extends _i1.PageRouteInfo<void> {
  const SettingsRouter() : super(name, path: 'settings');

  static const String name = 'SettingsRouter';
}

class PostsRoute extends _i1.PageRouteInfo<PostsRouteArgs> {
  PostsRoute({_i2.Key? key})
      : super(name, path: '', args: PostsRouteArgs(key: key));

  static const String name = 'PostsRoute';
}

class PostsRouteArgs {
  const PostsRouteArgs({this.key});

  final _i2.Key? key;
}

class SinglePostRoute extends _i1.PageRouteInfo<SinglePostRouteArgs> {
  SinglePostRoute({_i2.Key? key, required int postId})
      : super(name,
            path: ':postId',
            args: SinglePostRouteArgs(key: key, postId: postId),
            rawPathParams: {'postId': postId});

  static const String name = 'SinglePostRoute';
}

class SinglePostRouteArgs {
  const SinglePostRouteArgs({this.key, required this.postId});

  final _i2.Key? key;

  final int postId;
}

class UsersRoute extends _i1.PageRouteInfo<void> {
  const UsersRoute() : super(name, path: '');

  static const String name = 'UsersRoute';
}

class UserProfileRoute extends _i1.PageRouteInfo<UserProfileRouteArgs> {
  UserProfileRoute({_i2.Key? key, required int userId})
      : super(name,
            path: ':userId',
            args: UserProfileRouteArgs(key: key, userId: userId),
            rawPathParams: {'userId': userId});

  static const String name = 'UserProfileRoute';
}

class UserProfileRouteArgs {
  const UserProfileRouteArgs({this.key, required this.userId});

  final _i2.Key? key;

  final int userId;
}
