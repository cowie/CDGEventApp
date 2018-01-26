public class AccountTriggerHelper {
    public static void afterInsert(Map<Id,Account> newMap) {
        createFollowupTasks(newMap.values());
    }

    public static void createFollowupTasks(List<Account> accs) {
        List<Task> tasks = new List<Task>();
        for(Account acc:accs) {
            tasks.add(new Task(
                Subject = 'Get more information on ' + acc.Name,
                WhatID = acc.Id,
                ActivityDate = Date.today().addDays(7)
            ));
        }
        if(tasks != null && tasks.isEmpty()) {
            insert tasks;
        }
    }
}