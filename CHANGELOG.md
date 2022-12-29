## [Unreleased]

- Extract shared/mutual attributes for `vimeo_id` and `additional_info` from `VimeoRuby::User` and `VimeoRuby::Video` to parent class `VimeoRuby::Base`.
- Use consistent style when defining class or module level methods.
- Switch to set Authorization header with `access_token` aka `ENV["VIMEO_ACCESS_TOKEN"]` value and use for authorization when accessing public Vimeo API endpoints vs the previous basic_auth strategy.
- Change method signature for `VimeoRuby::get_user` method, now takes kwarg of `access_token`. Rename param in `VimeoRuby::get_video` method.
- `VimeoRuby::Base` now initializes with access_token
- Drop `Base::access_token` method.
- Add kwarg for access_token in `Base::get` method.

## [0.4.3] - 2022-12-29

- Inject `VimeoRuby::User` class in `VimeoRuby::Video::new` as default arg.

## [0.4.2] - 2022-12-29

- Refactor `VimeoRuby::User#uploaded_videos` method.

## [0.4.1] - 2022-12-29

- Fix erroneous minor version release (yanked 0.4.0).

## [0.4.0] - 2022-12-29

- Save unnecessary call to get a users uploaded video collection if we already have it and no additional query params are passed in to `VimeoRuby::User#uploaded_videos`.

## [0.3.0] - 2022-12-29

- Add shorthand methods on `VimeoRuby` module for `get_user(<vimeo_id>)` and `get_video(<vimeo_id>)` to retrieve the appropriate data.

## [0.2.0] - 2022-12-28

- Initial User and Video classes, with beginning interface to retrieve records from the Vimeo API. Adds a connection class used to hold a collection of a users uploaded videos (VimeoRuby::User::UploadedVideoCollection) accessible by calling `VimeoRuby::User#uploaded_videos`.

## [0.1.0] - 2022-12-25

- Initial release.
