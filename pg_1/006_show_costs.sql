--| Some important cost settings
--| See Shaik, Baji; PostgreSQL Configuration, apress 2020.

SHOW seq_page_cost;
SHOW random_page_cost;
SHOW cpu_tuple_cost;
SHOW cpu_index_tuple_cost;
SHOW cpu_operator_cost;