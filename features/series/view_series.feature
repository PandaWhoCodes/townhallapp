Feature: View Series

  In order to see what other people have submitted
  a citizen
  wants to browse the submission for a particular series

  Scenario: Viewing a series with no submissions
    Given a series exists
    And no are no submissions for that series
    When I view that series
    Then I should see "There are no submissions"

  Scenario: Order of submissions

    The submissions with the highest score should appear first

    Given a series with the following submissions:
      | name         | score |
      | Submission A | 0     |
      | Submission B | 5     |
      | Submission C | -5    |
    When I view that series
    Then I should see the submissions in the order:
      | Submission B |
      | Submission A |
      | Submission C |

  @wip
  Scenario: Submission visibility when viewing a series

    The series should only shown submissions which are part of that series.

    Given the following submissions:
      | name         | series   |
      | Submission A | Series 1 |
      | Submission B | Series 2 |
    When I view the series "Series 1"
    Then I should see "Submission A"
    But I should not see "Submission B"