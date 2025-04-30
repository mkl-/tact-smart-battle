Partial solutions by `mkl-` (final standing 201st, 474.59 points).

[Original competition repo](https://github.com/ton-studio/tact-smart-battle)

| Task | Score |
|------|-------|
| A    | 99.73 |
| B    | 162.59 |
| C    | 212.27 |
| D    | 0 |
| E    | - |

It was a fun contest.

# 🧠 Tact Smart Battle 🤜🤛

### Organized by [TON Studio](https://tonstudio.io/) & [Codeforces](https://codeforces.com/)

Welcome to the ultimate smart contract challenge built on [Tact](https://docs.tact-lang.org/) — the language for scalable smart contracts on TON. Compete with other developers, write efficient on-chain code, and win Toncoin and exclusive SBTs.

---


## 🗂️ Challenge Structure

The challenge consists of 5 tasks with increasing complexity. Each one focuses on specific smart contract design and optimization patterns.

| Task Level | Title                         | Description                                                 |
|------------|-------------------------------|-------------------------------------------------------------|
| 1          | Simple Voting                 | A basic single-contract voting system.                      |
| 2          | Serial Voting                 | Deploy multiple proposals through a master contract.        |
| 3          | Scalable Voting               | Handle up to 4 billion voters within strict storage limits. |
| 4          | Voting with Refunds           | Add TON refund logic for voters and master contract top-ups.|
| 5          | Gas-Managed Voting            | Combine scalability, refunds, and gas management.           |



## 🧪 How to Participate

### 🛠 Prerequisites

- [Node.js + npm](https://nodejs.org/)
- [Git CLI](https://git-scm.com/downloads)

### 🚀 Quick Start
1. **Create or log in to your Codeforces account**
    - Go to [codeforces.com](https://codeforces.com/)
    - If you don’t have an account yet, click “Register” and follow the instructions.


2. **Register for the Tact Smart Battle challenge**
    - After logging in, visit the official challenge page on [Codeforces](https://codeforces.com/contests/2105) ([Registration guide](registration.md)).
    - Complete the registration form.
    - Be sure to enter your:
        - **Telegram username** — for community contact and support
        - **TON wallet address** — to receive Toncoin prizes and SBTs


3. **Clone the official challenge repository**

    - This repo contains all templates, tests, and structure:
   ```bash
   git clone https://github.com/ton-studio/tact-smart-battle.git
   cd tact-smart-battle
   ```
4. Install dependencies:
    ```bash
   npm install
   ```
5. **Solve tasks locally**
    - Each task has a separate .tact file
    - You can run public tests using:
       ```bash
      npm run test1      # test for Task 1
       npm run test2      # test for Task 2
       npm run test       # run all public tests
      ```
6. **Submit your solution on Codeforces**

    - Go to the Codeforces challenge page for the task you’ve completed.
-
    - ![img_1.png](images/img_1.png)


- Upload your `.tact` file that matches the task:
    - `solution1.tact` — for Task 1
    - `solution2.tact` — for Task 2
    - and so on
- Submit the file using the provided web form on Codeforces.


-
    - ![img_2.png](images/img_2.png)
>     ⚠️ **Do not upload zipped folders or multiple files.** Each submission must contain only one `.tact` file for a single task.

7. **Repeat for other tasks**

    - You can submit other tasks in the same way — one at a time.
    - If you improve your solution, you can **resubmit it**.
    - You are allowed **up to 3 submissions per hour per task**.
    - The system will automatically select your **highest scoring solution** for each task and use it in the final leaderboard.


---

### 📊 How results will be displayed

After you submit a solution, the system will automatically evaluate it and select your best attempt for each task. The final leaderboard will show your highest score per task and your total points.

The leaderboard will look like this, so you can see all of your submissions:

![img_5.png](images/img_5.png)
Leaderboard Example

> ✅ Only verified participants with at least one valid solution will appear on the final leaderboard.

---

### ❗ Error Feedback

The system provides feedback for the following types of errors:

- **Compilation errors** — if your `.tact` file fails to compile or crashes during test execution (e.g., throws an exit code), the error message and details will be shown.
- **Test failures** — if your contract does not pass the required interface or logic checks, the failed test cases will be displayed.

This helps you improve your solution and resubmit until you get the best possible result.



## 📦 Submission Format

- Submit **only the smart contract file** for the specific task:
    - `solution1.tact` — for Task 1
    - `solution2.tact` — for Task 2
    - `solution3.tact` — and so on

- Do **not** upload multiple files or zip archives.
- File names **must exactly match** the required format, or your submission will be rejected.

> ❗ Each submission is for **a single task only**. You cannot submit all tasks at once.

---

## 🧮 Tact Smart Battle – Scoring System

The total score in this challenge is **1000 points**, distributed across 5 tasks of increasing difficulty.

Each task includes:
- **Logic Score** — awarded for passing private tests.
- **Gas Bonus** — awarded for efficient, low-gas implementations (only for full-passing solutions).

---

### 🎯 Scoring Breakdown

| Task | Title                  | Logic Score | Gas Bonus | Total Points |
|------|------------------------|-------------|-----------|--------------|
| 1    | Simple Voting          | 90          | +10       | **100**      |
| 2    | Master Contract        | 150         | +20       | **170**      |
| 3    | Scalable Voting        | 200         | +20       | **220**      |
| 4    | Voting + Refunds       | 220         | +30       | **250**      |
| 5    | Gas-Managed Voting     | 230         | +30       | **260**      |
|      |                        |             |           | **1000**     |


### ✅ Logic Score

Each task includes a set of **private tests**. You earn logic points **only if you pass all of them**.

> For example:  
> If Task 3 has 10 private tests, and you pass all 10 — you receive the full **200 points**.  
> If you fail even one test — you get **0** for the logic part.

This ensures your solution is fully correct and production-ready before it’s rewarded.





### ⚙️ Gas Bonus

To encourage optimization, each task also includes a **Gas Bonus** — awarded **only if your solution passes all private tests**.

Contracts are compared based on actual gas usage during test runs.

- The most gas-efficient solution gets the **full gas bonus**.
- Other full-passing solutions receive a **scaled bonus** based on how close they are to the reference solution.

> 💡 If your solution is **more efficient than the reference**, you can **score above the listed Total Points** for that task.

Gas really matters. Optimize smartly.

---

## 🔒 Notes

- You can resubmit improved solutions. Only the **highest scoring attempt per task** will be used in the final result.

- Partial solutions are still counted for logic points, but **do not qualify for gas bonus**.

---

Good luck, and aim for both correctness and efficiency! ⚔️🚀

---

## 🏆 Prize Pool

Total Prize Pool: **$20,000 in Toncoin**

Top 128 participants will receive Toncoin prizes and SBTs (Soulbound Tokens).

### Prize Breakdown:

- 🥇 **Top 16** — $10,000 total
- 🥈 **Ranks 17–64** — $7,000 total
- 🥉 **Ranks 65–128** — $3,000 total

### 🎖 Soulbound Tokens (SBTs)

- Everyone who scores ≥1 point and provides a valid, verifiable submission will receive a **Participant SBT**.
- Top 16 participants will also receive a **Winner SBT**.

> ⚠️ Public sharing of solutions before the deadline will disqualify your SBT eligibility.

---

## 📝 Submission Rules

- Participants solve tasks **locally** in this repository.
- Each solution is submitted **individually via Codeforces**: [codeforces.com](https://codeforces.com/register).
- Final deadline: **April 28, 12:00 (UTC+3)**.
- Do **not** make public your solutions before the deadline.
- If at least one solution passes, you will be included in the final leaderboard.
- You can use all the features of the language

---

## 📅 Timeline

- 📝 Registration: [codeforces.com/register](https://codeforces.com/contests/2105)
- 🚀 Challenge is open now
- 🛑 Final Submission Deadline: **April 28, 12:00 (UTC+3)**

---

## 🚀 Getting Started with Tact

New to Tact? These quickstart guides and tools will get you up to speed fast:

### 📚 Learn the Language
- [⚡ Learn Tact in Y Minutes](https://docs.tact-lang.org/book/learn-tact-in-y-minutes/)
- [🧠 Tact by Example](https://tact-by-example.org/00-hello-world)

### 🛠 Editor Support & Tools

- [💻 Tact VS Code Extension](https://marketplace.visualstudio.com/items?itemName=tonstudio.vscode-tact) 
    - <img src=images/img.png width="300"/>
- [🌐 TON Web IDE (online editor)](https://ide.ton.org/)
- [🔧 Blueprint CLI](https://github.com/ton-org/blueprint)
- [📁 Tact Project Template](https://github.com/tact-lang/tact-template)

---

## 💬 Community & Support

Join the developer chats to ask questions and connect with other participants:

- [Tact Smart Battle chat (for communication)](https://t.me/tact_smart_battle)
- [Tact Telegram](https://t.me/tactlang)
- [TON Dev Chat (English)](https://t.me/tondev_eng)
- [TON Dev Chat (Russian)](https://t.me/tondev)
- [TON Dev Chat (Chinese)](https://t.me/tondev_zh)

---

Good luck, and may your contracts be gas-efficient and bug-free ⚡
