part of 'goal_screen.dart';



class GoalScreenMobile extends GetView<GoalController> {
  const GoalScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Yet to Achieve'),
        leading: const BackButton(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      ),
      body: Obx(
            () => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Progress Bar
              LinearProgressIndicator(
                value: controller.progress,
                color: Colors.blueAccent,
                backgroundColor: Colors.grey[800],
                minHeight: 8,
              ),
              const SizedBox(height: 20),

              // Daily Goals
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Daily Goal',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.dailyGoals.length,
                        itemBuilder: (context, index) {
                          final goal = controller.dailyGoals[index];
                          return Card(
                            color: Colors.grey[900],
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: ListTile(
                              leading: Checkbox(
                                value: goal.completed,
                                onChanged: (_) =>
                                    controller.toggleGoal(index),
                                activeColor: Colors.blueAccent,
                              ),
                              title: Text(
                                goal.title,
                                style: const TextStyle(color: Colors.white),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: Colors.blueAccent),
                                    onPressed: () {
                                      // Example: simple edit
                                      Get.defaultDialog(
                                        title: 'Edit Goal',
                                        content: TextField(
                                          autofocus: true,
                                          onSubmitted: (value) {
                                            if (value.isNotEmpty) {
                                              controller.editGoal(index, value);
                                              Get.back();
                                            }
                                          },
                                          decoration: InputDecoration(
                                            hintText: goal.title,
                                            hintStyle:
                                            const TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.redAccent),
                                    onPressed: () =>
                                        controller.deleteGoal(index),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Suggested Goals
              const Text(
                'Suggested goal for you',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.suggestedGoals.length,
                  itemBuilder: (context, index) {
                    final goal = controller.suggestedGoals[index];
                    return Card(
                      color: Colors.grey[900],
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: Checkbox(
                          value: false,
                          onChanged: (_) => controller.addSuggestedGoal(index),
                          activeColor: Colors.blueAccent,
                        ),
                        title: Text(
                          goal.title,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
