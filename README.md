# README

## users テーブル

nickname | string | null: false |
email    | string | null: false |
encrypted_password | string | null: false |

## petsテーブル
pets_name    | string | null: false |
kind_id      | string | null: false |
sex_id       | string | null: false |
birthday_id  | integer| null: false |
family_day_id| integer| null: false |
user         | references | null: false, foreign_key: true  |

## diariesテーブル
symptoms | text | null: false |
progress | text | null: false |
medicine | string | null: false |
hospital | string | null: false |
pet_id   | string | null: false |
habit    | string | null: false |
favorite_food  | string | null: false |
favorite_place | string | null: false |

## costsテーブル
amount | string | null: false |
memo   | string | null: false |
image  | string | null: false |

## commentsテーブル
comment_text | string | null: false |
diary_id     | string | null: false |
user_id      | string | null: false |