import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business/blocs/company/company_bloc.dart';
import '../../business/di/injection.dart';
import '../../business/models/route.dart' as route_model;

class RouteDetailScreen extends StatelessWidget {
  const RouteDetailScreen({super.key, required this.route});
  final route_model.Route route;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CompanyBloc>(
      create: (context) =>
          getIt<CompanyBloc>()..add(LoadCompany(route.companyId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dettagli Viaggio'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Route Header Card
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  route.originCity,
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  route.originTerminal,
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.blue,
                            size: 32.0,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  route.destinationCity,
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                                Text(
                                  route.destinationTerminal,
                                  style: TextStyle(color: Colors.grey[600]),
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              route.basePrice != null
                                  ? '€${route.basePrice}'
                                  : 'Prezzo N/D',
                              style: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24.0),

              // Route Details
              const Text(
                'Dettagli del viaggio',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),

              _buildDetailRow(
                'Distanza',
                '${route.distanceKm} km',
                Icons.straighten,
              ),
              _buildDetailRow(
                'Durata stimata',
                '${route.estimatedDurationMinutes} minuti',
                Icons.access_time,
              ),
              _buildDetailRow(
                'Stato',
                route.isActive ? 'Attivo' : 'Non attivo',
                Icons.info,
              ),
              _buildDetailRow('Posti disponibili', '20', Icons.event_seat),

              const SizedBox(height: 24.0),

              // Company Information
              const Text(
                'Informazioni sulla compagnia',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),

              BlocBuilder<CompanyBloc, CompanyState>(
                builder: (context, state) {
                  if (state is CompanyLoading) {
                    return const Card(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    );
                  } else if (state is CompanyLoaded) {
                    final company = state.company;
                    return Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.business,
                                  size: 32.0,
                                  color: Colors.blue,
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        company.name,
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        company.address,
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12.0),
                            Text(
                              'Telefono: ${company.phone}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            Text(
                              'Email: ${company.email}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  size: 16.0,
                                  color: company.isActive
                                      ? Colors.green
                                      : Colors.red,
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  company.isActive ? 'Attiva' : 'Non attiva',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const Card(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.business,
                                  size: 32.0,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Unknown Company',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Company not found',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              'Telefono: N/A',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              'Email: N/A',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  size: 16.0,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  'Stato sconosciuto',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),

              const SizedBox(height: 24.0),

              // Schedule Information (placeholder)
              const Text(
                'Orari e disponibilità',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),

              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Orari di partenza',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Gli orari specifici e la disponibilità dei posti saranno integrati con il sistema di prenotazione.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24.0),

              // Seats Information
              const Text(
                'Posti disponibili',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),

              // Simulate seats grid
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(20, (index) {
                  final seatNumber = index + 1;
                  final isAvailable =
                      seatNumber % 3 != 0; // Simulate some occupied
                  return Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: isAvailable ? Colors.green[100] : Colors.red[100],
                      border: Border.all(
                        color: isAvailable ? Colors.green : Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        '$seatNumber',
                        style: TextStyle(
                          color: isAvailable
                              ? Colors.green[800]
                              : Colors.red[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 32.0),
            ],
          ),
        ),
        bottomNavigationBar:
            // Book Button
            Container(
              width: double.infinity,
              height: 100,

              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(26.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withValues(alpha: 0.3),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Simulate booking
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Prenotazione Confermata'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 48.0,
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            'La tua prenotazione per ${route.originCity} - ${route.destinationCity} è stata confermata!',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Codice prenotazione: ${DateTime.now().millisecondsSinceEpoch}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.confirmation_number,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Prenota ora',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, size: 20.0, color: Colors.blue),
          const SizedBox(width: 12.0),
          Text(
            label,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(fontSize: 16.0, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
