import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late PageController _pageController;
  late DateTime _currentDate;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: DateTime.now().month - 1);
    _currentDate = DateTime.now();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove a seta de voltar para trás
        backgroundColor: Colors.grey[800], // Cor cinzento escuro
        title: Row(
          children: [
            const Text(
              'VIRIATOS SCOUTING',
              style: TextStyle(
                fontFamily: 'FuturaStd',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.account_circle, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFFA8A8A8), // Cinzento em baixo
              Color(0xFFFFFFFF), // Branco em cima
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 16), // Ajuste de espaçamento para evitar overflow
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.sports_soccer, color: Colors.black), // Ícone de bola de futebol
                SizedBox(width: 8),
                Text(
                  'AGENDA DE TAREFAS',
                  style: TextStyle(
                    fontFamily: 'FuturaStd',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16), // Ajuste de espaçamento para evitar overflow
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.yellow[700],
                  ),
                  child: const Text(
                    'Calendário',
                    style: TextStyle(
                      fontFamily: 'FuturaStd',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey[300],
                  ),
                  child: const Text(
                    'Lista',
                    style: TextStyle(
                      fontFamily: 'FuturaStd',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemBuilder: (context, index) {
                  DateTime date = DateTime(_currentDate.year, index + 1);
                  return _buildCalendar(date);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run),
            label: 'Tarefas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
        selectedItemColor: Colors.yellow[700],
      ),
    );
  }

  Widget _buildCalendar(DateTime date) {
    List<Widget> weeks = [];
    int daysInMonth = DateTime(date.year, date.month + 1, 0).day;
    int startWeekDay = DateTime(date.year, date.month, 1).weekday;
    int totalDays = daysInMonth + startWeekDay - 1;

    for (int i = 0; i < totalDays; i++) {
      if (i % 7 == 0) {
        weeks.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(7, (index) {
            int day = i + index - startWeekDay + 2;
            return day > 0 && day <= daysInMonth
                ? _buildDay(day, date.month)
                : SizedBox(width: 40, height: 40);
          }),
        ));
      }
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '${date.month}/${date.year}',
            style: const TextStyle(
              fontFamily: 'FuturaStd',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        Column(
          children: weeks,
        ),
      ],
    );
  }

  Widget _buildDay(int day, int month) {
    bool isHighlighted = false; // Lógica para verificar se o dia é destacado
    String eventDescription = ""; // Descrição do evento para o dia

    // Exemplo de lógica para destacar dias específicos
    if (month == 10 && (day == 1 || day == 10 || day == 27)) {
      isHighlighted = true;
      eventDescription = "Assistir\njogo";
    }

    return GestureDetector(
      onTap: () {
        // Adiciona a lógica de eventos aqui
      },
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isHighlighted ? Colors.yellow[700] : Colors.transparent,
            ),
            child: Text(
              day.toString(),
              style: const TextStyle(
                fontFamily: 'FuturaStd',
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          if (isHighlighted)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                eventDescription,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'FuturaStd',
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
