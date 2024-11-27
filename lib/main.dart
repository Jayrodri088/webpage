import 'package:flutter/material.dart';

void main() {
  runApp(const ReachOutWebApp());
}

class ReachOutWebApp extends StatelessWidget {
  const ReachOutWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BackgroundPage(),
    );
  }
}

class BackgroundPage extends StatefulWidget {
  const BackgroundPage({super.key});

  @override
  State<BackgroundPage> createState() => _BackgroundPageState();
}

class _BackgroundPageState extends State<BackgroundPage> {
  // Track the expanded state of dropdowns
  Map<String, bool> isExpanded = {
    "Workforce Management": false,
    "Church Operation": false,
    "ROWD Operation": false,
    "Procurement": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fullscreen Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/BG.png",
              fit: BoxFit.cover, // Ensures the image covers the entire screen
            ),
          ),
          // Main Content
          Column(
            children: [
              // Navigation Bar
              _buildNavBar(),
              Expanded(
                child: Row(
                  children: [
                    // Sidebar
                    _buildSidebar(),
                    // Main Content Area
                    _buildContentArea(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Build the NavBar Widget
  Widget _buildNavBar() {
    return Container(
      height: 70,
      color: const Color(0xFFF4F6FC), // Light blue-grayish background
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Section (Logo, Title, and Dashboard Text)
          Row(
            children: [
              Image.asset(
                "assets/logo.png",
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 10),
              const Text(
                "REACHOUT WORLD DAY",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 50), // Spacing between title and "Dashboard"
              const Text(
                "Dashboard",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          // Right Section (Search Bar, Notification, Profile)
          Row(
            children: [
              // Search Bar
              Container(
                width: 300,
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      "Search anything here...",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              // Notification Icon
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.notifications_none,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 20),
              // Profile
              const Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/profile.png"),
                    radius: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Abimbola",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Build the Sidebar Widget
  Widget _buildSidebar() {
    return Container(
      width: 220, // Sidebar width
      color: const Color(0xFFF4F6FC), // Light blue-grayish background
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Church Operation",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
            indent: 16,
            endIndent: 16,
          ),
          // Sidebar Items
          buildSidebarItem("assets/dashboard.png", "Dashboard", true),
          buildDropdownSidebarItem(
              "assets/workforce.png", "Workforce Management", [
            "Attendance",
            "Performance",
            "Teams",
          ]),
          buildDropdownSidebarItem(
              "assets/church.png", "Church Operation", [
            "Events",
            "Programs",
            "Reports",
          ]),
          buildDropdownSidebarItem(
              "assets/Group.png", "ROWD Operation", [
            "Outreach",
            "Planning",
            "Execution",
          ]),
          buildDropdownSidebarItem(
              "assets/procure.png", "Procurement", [
            "Orders",
            "Supplies",
            "Invoices",
          ]),
          const Spacer(),
          // Logout Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Image.asset(
                  "assets/logout.png",
                  width: 20,
                  height: 20,
                  color: Colors.orange,
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Log Out",
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Build the Content Area Widget
  Widget _buildContentArea() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumb and Last Updated on the same line
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Dashboard > Home",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Last Updated: Nov 26, 2024 - 09:56 AM",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Sidebar Item Widget
  Widget buildSidebarItem(String iconPath, String title, [bool selected = false]) {
    return Container(
      color: selected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            width: 20,
            height: 20,
            color: selected ? Colors.blue : Colors.black54,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              color: selected ? Colors.blue : Colors.black87,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // Dropdown Sidebar Item Widget
  Widget buildDropdownSidebarItem(
      String iconPath, String title, List<String> subItems) {
    final isCurrentlyExpanded = isExpanded[title] ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded[title] = !isCurrentlyExpanded;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            color: isCurrentlyExpanded
                ? Colors.blue.withOpacity(0.1)
                : Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      iconPath,
                      width: 20,
                      height: 20,
                      color:
                          isCurrentlyExpanded ? Colors.blue : Colors.black54,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      title,
                      style: TextStyle(
                        color:
                            isCurrentlyExpanded ? Colors.blue : Colors.black87,
                        fontWeight: isCurrentlyExpanded
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Icon(
                  isCurrentlyExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: isCurrentlyExpanded ? Colors.blue : Colors.black54,
                ),
              ],
            ),
          ),
        ),
        if (isCurrentlyExpanded)
          Padding(
            padding: const EdgeInsets.only(left: 48.0), // Indent for sub-items
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: subItems.map((subItem) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    subItem,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
