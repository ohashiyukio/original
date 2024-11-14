# README

## users テーブル

nickname | string | null: false |
email    | string | null: false |
encrypted_password | string | null: false |

## petsテーブル
pets_name    | string | null: false |
kind_id      | integer | null: false |
sex_id       | integer | null: false |
birthday_id  | integer| null: false |
family_day_id| integer| null: false |
user         | references | null: false, foreign_key: true  |

## association
belongs_to:  user
has_many:    diary

## diariesテーブル
comment_text | string | null: false |
pet          | references | null: false, foreign_key: true  |
room         | text   | null: false |

## association
belongs_to :pet
has_one_attached :image

## costsテーブル
amount | string | null: false |
memo   | string | null: false |
image  | string | null: false |

## questionsテーブル
symptoms | text   | null: false |
progress | text   | null: false |
medicine | string | null: false |
hospital | string | null: false |
pet_id   | references | null: false, foreign_key: true  |
habit    | string | null: false |
favorite_food  | string | null: false |
favorite_place | string | null: false |

## association
belongs_to :pet
has_one_attached :image
