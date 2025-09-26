import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business/blocs/user/user_bloc.dart';
import '../../routes/route_generator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        final currentUser = state is UserLoaded ? state.currentUser : null;

        if (currentUser == null) {
          return const CupertinoPageScaffold(
            child: Center(child: Text('Nessun utente loggato')),
          );
        }

        return CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            middle: Text('Impostazioni'),
          ),
          child: SafeArea(
            child: ListView(
              children: [
                // User Info Section
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30.0,
                        backgroundColor: CupertinoColors.systemBlue,
                        child: Icon(
                          CupertinoIcons.person_fill,
                          color: CupertinoColors.white,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentUser.name,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              currentUser.email,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                // Settings Sections
                CupertinoListSection(
                  header: const Text('Account'),
                  children: [
                    CupertinoListTile(
                      leading: const Icon(CupertinoIcons.pencil),
                      title: const Text('Modifica Profilo'),
                      subtitle: const Text('Aggiorna le tue informazioni'),
                      trailing: const CupertinoListTileChevron(),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteGenerator.editUser,
                          arguments: currentUser,
                        );
                      },
                    ),
                  ],
                ),

                CupertinoListSection(
                  header: const Text('Info App'),
                  children: const [
                    CupertinoListTile(
                      leading: Icon(CupertinoIcons.info),
                      title: Text('Versione'),
                      subtitle: Text('1.0.0'),
                    ),
                  ],
                ),
                CupertinoListSection(
                  header: const Text('Azioni'),
                  children: [
                    //CupertinoListTile(
                    //leading: const Icon(CupertinoIcons.square_arrow_right),
                    //title: const Text('Esci'),
                    //subtitle: const Text('Disconnettiti dall\'app'),
                    //onTap: () {
                    //context.read<UserBloc>().add(LogoutUser());
                    //Navigator.pushReplacementNamed(
                    //  context,
                    //   RouteGenerator.login,
                    //  );
                    // },
                    //),
                    CupertinoListTile(
                      leading: const Icon(
                        CupertinoIcons.delete,
                        color: CupertinoColors.destructiveRed,
                      ),
                      title: const Text(
                        'Elimina Account',
                        style: TextStyle(color: CupertinoColors.destructiveRed),
                      ),
                      subtitle: const Text(
                        'Elimina definitivamente il tuo account',
                      ),
                      onTap: () async {
                        final result = await showCupertinoDialog<bool>(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: const Text('Conferma Eliminazione'),
                            content: const Text(
                              'Sei sicuro di voler eliminare l\'account? Tutti i dati verranno persi e non potrai recuperarli.',
                            ),
                            actions: [
                              CupertinoDialogAction(
                                child: const Text('Annulla'),
                                onPressed: () => Navigator.pop(context, false),
                              ),
                              CupertinoDialogAction(
                                child: const Text(
                                  'Elimina',
                                  style: TextStyle(
                                    color: CupertinoColors.destructiveRed,
                                  ),
                                ),
                                onPressed: () => Navigator.pop(context, true),
                              ),
                            ],
                          ),
                        );

                        if (result == true) {
                          if (!context.mounted) return;
                          context.read<UserBloc>().add(DeleteAccount());
                          Navigator.pushReplacementNamed(
                            context,
                            RouteGenerator.login,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
