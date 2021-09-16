# Social

Features related to user accounts and user interactions

# Table of contents

1. [View todo](#view-todo)

2. [User Profile](#user-profile)

3. [Follow user](#follow-user)

2. [User Creation](#user-creation)

3. [Login](#login)

4. [Logout](#logout)

5. [Recover Password](#recover-password)

6. [Update Profile](#update-profile)

7. [Update Settings](#update-settings)


## View todo

Users can view other users bucket lists. This can be accomplished by:

1. Feed of users followed

2. Browsing all todos lists

3. Visiting a user profile to see their todos

These views can be filtered and sorted too.

Possible filters:

a. User

b. Todo item

c. Complete/incomplete

Possible sorting:

a. Date of creation

b. Date of completion

## User profile

The following data about an User is visible to other Users on the application:

* Avatar

* Name

* Description

    * Bio/about

* Age

    * Calculated from birthday

* Stats about todo lists (e.g., completion)

    * TBD

Conversely, the following information is private:

* Email

* Password

    * Saved encrypted in the database

* Visibility status (Premium)

    * Make bucket lists private

    * Make profile private

## Follow user

Users can be followed so their todo list changes are displayed for their followers.

## User Creation

Users are created by supplying the following data:

1.  Email

    * Must be unique

2.  Password

    * Non black, 5 or more characters

3. Membership status

    * Choose to make one time donation to unlock more features or use for free

## Login

Login works as traditional by supplying account details.

## Logout

Users can manually end their session at any time.

## Recover Password

Users can request to reset their password in the occasion it is lost. Password reseting is done via email, by supplying a secret link- the application never emails existing passwords.

## Update Profile

User can update their information visible to other Users here.

## Update Settings

User can update their private information here, as well opt to upgrade their account.
