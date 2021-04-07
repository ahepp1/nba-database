Alex Hepp, Nico Ivanov
ahepp1, nivanov4


Most of the issues we ran into involved poor data cleanliness. Much of the data we had to pull from was messy and poorly formatted. There were some pieces of data that did not exist, for example those of stats or awards in the years before the NBA began to record or award them. We also had some issues finding reliable salary figures for both coaches and players (especially players who were less well known), and thus decided not to include it in the dataset (the data we found was LARGELY incomplete). We also had some issues with special figures in player's names not encoding properly, and had to manually alter many of them to fit foreign key restraints. There were also a few primary keys in the Team entity that caused deletions in the Stat entity because of the foreign key constraints, but we will try to dig up these data in the future.

In all it was a grueling process but we believe our entity set to be largely complete and able to answer the questions we derived in Part A. 