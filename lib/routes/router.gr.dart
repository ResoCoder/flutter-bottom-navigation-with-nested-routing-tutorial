// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i8;

import '../home_page.dart' as _i1;
import '../posts/posts_page.dart' as _i4;
import '../posts/single_post_page.dart' as _i7;
import '../settings/settings_page.dart' as _i3;
import '../users/user_profile_page.dart' as _i6;
import '../users/users_page.dart' as _i5;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    PostRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    PostsRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    UsersRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    SettingsRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SettingsPage());
    },
    PostsRoute.name: (routeData) {
      final args = routeData.argsAs<PostsRouteArgs>(
          orElse: () => const PostsRouteArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.PostsPage(key: args.key));
    },
    UsersRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.UsersPage());
    },
    UserRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    UserProfileRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<UserProfileRouteArgs>(
          orElse: () =>
              UserProfileRouteArgs(userId: pathParams.getInt('userId')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.UserProfilePage(key: args.key, userId: args.userId));
    },
    UserPostsRoute.name: (routeData) {
      final args = routeData.argsAs<UserPostsRouteArgs>(
          orElse: () => const UserPostsRouteArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.PostsPage(key: args.key));
    },
    SinglePostRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SinglePostRouteArgs>(
          orElse: () =>
              SinglePostRouteArgs(postId: pathParams.getInt('postId')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.SinglePostPage(key: args.key, postId: args.postId));
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(HomeRoute.name, path: '/', children: [
          _i2.RouteConfig(PostsRouter.name,
              path: 'posts',
              parent: HomeRoute.name,
              children: [
                _i2.RouteConfig(PostsRoute.name,
                    path: '', parent: PostsRouter.name)
              ]),
          _i2.RouteConfig(UsersRouter.name,
              path: 'users',
              parent: HomeRoute.name,
              children: [
                _i2.RouteConfig(UsersRoute.name,
                    path: '', parent: UsersRouter.name),
                _i2.RouteConfig(UserRouter.name,
                    path: ':userId',
                    parent: UsersRouter.name,
                    children: [
                      _i2.RouteConfig(UserProfileRoute.name,
                          path: '', parent: UserRouter.name),
                      _i2.RouteConfig(UserPostsRoute.name,
                          path: 'posts', parent: UserRouter.name)
                    ])
              ]),
          _i2.RouteConfig(SettingsRouter.name,
              path: 'settings', parent: HomeRoute.name)
        ]),
        _i2.RouteConfig(PostRouter.name, path: '/post', children: [
          _i2.RouteConfig(SinglePostRoute.name,
              path: ':postId', parent: PostRouter.name)
        ])
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute({List<_i2.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class PostRouter extends _i2.PageRouteInfo<void> {
  const PostRouter({List<_i2.PageRouteInfo>? children})
      : super(PostRouter.name, path: '/post', initialChildren: children);

  static const String name = 'PostRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class PostsRouter extends _i2.PageRouteInfo<void> {
  const PostsRouter({List<_i2.PageRouteInfo>? children})
      : super(PostsRouter.name, path: 'posts', initialChildren: children);

  static const String name = 'PostsRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class UsersRouter extends _i2.PageRouteInfo<void> {
  const UsersRouter({List<_i2.PageRouteInfo>? children})
      : super(UsersRouter.name, path: 'users', initialChildren: children);

  static const String name = 'UsersRouter';
}

/// generated route for
/// [_i3.SettingsPage]
class SettingsRouter extends _i2.PageRouteInfo<void> {
  const SettingsRouter() : super(SettingsRouter.name, path: 'settings');

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i4.PostsPage]
class PostsRoute extends _i2.PageRouteInfo<PostsRouteArgs> {
  PostsRoute({_i8.Key? key})
      : super(PostsRoute.name, path: '', args: PostsRouteArgs(key: key));

  static const String name = 'PostsRoute';
}

class PostsRouteArgs {
  const PostsRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'PostsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.UsersPage]
class UsersRoute extends _i2.PageRouteInfo<void> {
  const UsersRoute() : super(UsersRoute.name, path: '');

  static const String name = 'UsersRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class UserRouter extends _i2.PageRouteInfo<void> {
  const UserRouter({List<_i2.PageRouteInfo>? children})
      : super(UserRouter.name, path: ':userId', initialChildren: children);

  static const String name = 'UserRouter';
}

/// generated route for
/// [_i6.UserProfilePage]
class UserProfileRoute extends _i2.PageRouteInfo<UserProfileRouteArgs> {
  UserProfileRoute({_i8.Key? key, required int userId})
      : super(UserProfileRoute.name,
            path: '',
            args: UserProfileRouteArgs(key: key, userId: userId),
            rawPathParams: {'userId': userId});

  static const String name = 'UserProfileRoute';
}

class UserProfileRouteArgs {
  const UserProfileRouteArgs({this.key, required this.userId});

  final _i8.Key? key;

  final int userId;

  @override
  String toString() {
    return 'UserProfileRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i4.PostsPage]
class UserPostsRoute extends _i2.PageRouteInfo<UserPostsRouteArgs> {
  UserPostsRoute({_i8.Key? key})
      : super(UserPostsRoute.name,
            path: 'posts', args: UserPostsRouteArgs(key: key));

  static const String name = 'UserPostsRoute';
}

class UserPostsRouteArgs {
  const UserPostsRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'UserPostsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.SinglePostPage]
class SinglePostRoute extends _i2.PageRouteInfo<SinglePostRouteArgs> {
  SinglePostRoute({_i8.Key? key, required int postId})
      : super(SinglePostRoute.name,
            path: ':postId',
            args: SinglePostRouteArgs(key: key, postId: postId),
            rawPathParams: {'postId': postId});

  static const String name = 'SinglePostRoute';
}

class SinglePostRouteArgs {
  const SinglePostRouteArgs({this.key, required this.postId});

  final _i8.Key? key;

  final int postId;

  @override
  String toString() {
    return 'SinglePostRouteArgs{key: $key, postId: $postId}';
  }
}
