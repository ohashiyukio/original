# README

## users テーブル

nickname | string | null: false |
email    | string | null: false |
encrypted_passwor | string | null: false |

## petsテーブル
pets_name | string | null: false |
kind| string | null: false |
sex| string | null: false |
birthday| null: false |
family_day| string |

## diariesテーブル
symptoms | text | null: false |
progress | text | null: false |
medicine | string | null: false |
hospital | string | null: false |
pet_id | string | null: false |
habit | string | null: false |
favorite_food | string | null: false |
favorite_place | string | null: false |

## costsテーブル
amount | string | null: false |
memo | string | null: false |
image | string | null: false |

## commentsテーブル
comment_text | string | null: false |
diary_id | string | null: false |
user_id | string | null: false |