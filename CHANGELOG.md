## [Unreleased]

## [0.4.0] - 2022-12-29

- Save unnecessary call to get a users uploaded video collection if we already have it and no additional query params are passed in to `VimeoRuby::User#uploaded_videos`.

## [0.3.0] - 2022-12-29

- Add shorthand methods on `VimeoRuby` module for `get_user(<vimeo_id>)` and `get_video(<vimeo_id>)` to retrieve the appropriate data.

## [0.2.0] - 2022-12-28

- Initial User and Video classes, with beginning interface to retrieve records from the Vimeo API. Adds a connection class used to hold a collection of a users uploaded videos (VimeoRuby::User::UploadedVideoCollection) accessible by calling `VimeoRuby::User#uploaded_videos`.

## [0.1.0] - 2022-12-25

- Initial release
