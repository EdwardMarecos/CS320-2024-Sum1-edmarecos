# CS320-2024-Sum1
For teaching BU CAS CS320: Concepts of Programming Languages

## Mirroring this repository

Please create a private repository that mirrors this one and update
frequently.

Step 1:

Please clone the class repository:

```
git clone https://github.com/hwxi/CS320-2024-Sum1
```

Step 2:

Please create a repository of your own.
For instance, the following one is created
for my own use:

https://github.com/hwxi/CS320-2024-Sum1-hwxi

Then please mirror-push the class repo into your own repo:

```
cd CS320-2024-Sum1
git push --mirror https://github.com/hwxi/CS320-2024-Sum1-hwxi
git clone https://github.com/hwxi/CS320-2024-Sum1-hwxi
cd CS320-2024-Sum1-hwxi
git remote add upstream https://hwxi@github.com/hwxi/CS320-2024-Sum1.git
```

Step 3:

Please remember to sync with the class repo frequently:

```
git fetch upstream
git merge upstream/main main
```
