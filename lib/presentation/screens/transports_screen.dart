import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../business/blocs/route/route_bloc.dart';
import '../../business/models/route.dart' as route_model;
import '../widgets/custom_cupertino_scaffold.dart';

class TransportsScreen extends StatefulWidget {
  const TransportsScreen({super.key});

  @override
  State<TransportsScreen> createState() => _TransportsScreenState();
}

class _TransportsScreenState extends State<TransportsScreen> {
  final TextEditingController _searchController = TextEditingController();
  //DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    // Load routes when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<RouteBloc>().add(LoadRoutes());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomCupertinoPageScaffold(
      title: 'ERSAF SAMPLE',
      child: Column(
        children: [
          // Search and Filter Section
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[50],
            child: Column(
              children: [
                // Search Bar
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Cerca città di partenza o arrivo...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (query) {
                    context.read<RouteBloc>().add(SearchRoutes(query));
                  },
                ),
                //const SizedBox(height: 12.0),
                // Date Filter
                //Row(
                //children: [
                //Expanded(
                //child: OutlinedButton.icon(
                //onPressed: () async {
                //final picked = await showDatePicker(
                //context: context,
                // initialDate: _selectedDate ?? DateTime.now(),
                // firstDate: DateTime.now(),
                //  lastDate: DateTime.now().add(const Duration(days: 90)),
                // );
                //if (picked != null) {
                // if (context.mounted) {
                //setState(() => _selectedDate = picked);
                // context.read<RouteBloc>().add(FilterRoutesByDate(picked));
                // }
                // }
                //},
                //icon: const Icon(Icons.calendar_today),
                //label: Text(
                // _selectedDate != null
                //   ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
                //     : 'Seleziona data',
                // ),
                //style: OutlinedButton.styleFrom(
                // padding: const EdgeInsets.symmetric(vertical: 12.0),
                // shape: RoundedRectangleBorder(
                //  borderRadius: BorderRadius.circular(8.0),
                // ),
                //),
                //),
                //),
                //if (_selectedDate != null)
                // IconButton(
                //onPressed: () {
                // setState(() => _selectedDate = null);
                //  context.read<RouteBloc>().add(LoadRoutes());
                // },
                //  icon: const Icon(Icons.clear),
                //  ),
                //],
                //),
              ],
            ),
          ),
          // Routes List
          Expanded(
            child: BlocBuilder<RouteBloc, RouteState>(
              builder: (context, state) {
                if (state is RouteLoading) {
                  return _buildShimmerLoading();
                } else if (state is RouteLoaded) {
                  if (state.routes.isEmpty) {
                    return const Center(child: Text('Nessun viaggio trovato'));
                  }
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<RouteBloc>().add(LoadRoutes());
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: state.routes.length,
                      itemBuilder: (context, index) {
                        final route = state.routes[index];
                        return _buildRouteCard(context, route);
                      },
                    ),
                  );
                } else if (state is RouteError) {
                  return _buildErrorState(context, state.message);
                }
                return const Center(
                  child: Text('Seleziona i filtri per cercare viaggi'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerLoading() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              height: 120.0,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 20.0, width: 150.0, color: Colors.white),
                  const SizedBox(height: 8.0),
                  Container(height: 16.0, width: 100.0, color: Colors.white),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      Container(height: 14.0, width: 80.0, color: Colors.white),
                      const Spacer(),
                      Container(height: 14.0, width: 60.0, color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRouteCard(BuildContext context, route_model.Route route) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 4.0,
      child: InkWell(
        onTap: () {
          // Navigate to route details
          Navigator.pushNamed(context, '/route-details', arguments: route);
        },
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Route cities
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          route.originCity,
                          style: const TextStyle(
                            fontSize: 18.0,
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
                  const Icon(Icons.arrow_forward, color: Colors.blue),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          route.destinationCity,
                          style: const TextStyle(
                            fontSize: 18.0,
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
              const SizedBox(height: 12.0),
              // Route details
              Row(
                children: [
                  Icon(Icons.access_time, size: 16.0, color: Colors.grey[600]),
                  const SizedBox(width: 4.0),
                  Text(
                    '${route.estimatedDurationMinutes} min',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 16.0),
                  Icon(Icons.straighten, size: 16.0, color: Colors.grey[600]),
                  const SizedBox(width: 4.0),
                  Text(
                    '${route.distanceKm} km',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const Spacer(),
                  Text(
                    route.basePrice != null
                        ? '€${route.basePrice}'
                        : 'Prezzo N/D',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64.0, color: Colors.red[300]),
          const SizedBox(height: 16.0),
          Text(
            'Errore nel caricamento',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8.0),
          SelectableText(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () {
              context.read<RouteBloc>().add(LoadRoutes());
            },
            child: const Text('Riprova'),
          ),
        ],
      ),
    );
  }
}
