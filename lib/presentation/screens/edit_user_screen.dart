import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business/blocs/user/user_bloc.dart';
import '../../business/models/user.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({super.key, required this.user});
  final User user;

  @override
  EditUserScreenState createState() => EditUserScreenState();
}

class EditUserScreenState extends State<EditUserScreen> {
  bool _isEditing = false;
  late TextEditingController _nameController;
  late TextEditingController _surnameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _surnameController = TextEditingController(text: widget.user.surname);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          _isEditing ? 'Modifica Profilo' : 'Profilo',
          style: const TextStyle(
            color: Color(0xFF2D3748),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF667EEA)),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          if (!_isEditing)
            TextButton(
              onPressed: () {
                setState(() {
                  _isEditing = true;
                });
              },
              child: const Text(
                'Modifica',
                style: TextStyle(
                  color: Color(0xFF667EEA),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Informazioni Personali',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3748),
                ),
              ),
              const SizedBox(height: 32),
              _buildInfoField(
                label: 'Nome',
                value: _isEditing ? null : widget.user.name,
                controller: _isEditing ? _nameController : null,
                icon: Icons.person,
              ),
              const SizedBox(height: 16),
              _buildInfoField(
                label: 'Cognome',
                value: _isEditing ? null : widget.user.surname,
                controller: _isEditing ? _surnameController : null,
                icon: Icons.person,
              ),
              const SizedBox(height: 16),
              _buildInfoField(
                label: 'Email',
                value: widget.user.email,
                icon: Icons.email,
                readOnly: true,
              ),
              const SizedBox(height: 16),
              _buildInfoField(
                label: 'UID',
                value: widget.user.uid,
                icon: Icons.perm_identity,
                readOnly: true,
              ),
              const SizedBox(height: 16),
              _buildInfoField(
                label: 'Account Creato',
                value:
                    '${widget.user.createdAt.day}/${widget.user.createdAt.month}/${widget.user.createdAt.year} ${widget.user.createdAt.hour}:${widget.user.createdAt.minute.toString().padLeft(2, '0')}:${widget.user.createdAt.second.toString().padLeft(2, '0')}',
                icon: Icons.calendar_today,
                readOnly: true,
              ),
              const SizedBox(height: 16),
              _buildInfoField(
                label: 'Ultimo Aggiornamento',
                value:
                    '${widget.user.updatedAt.day}/${widget.user.updatedAt.month}/${widget.user.updatedAt.year} ${widget.user.updatedAt.hour}:${widget.user.updatedAt.minute.toString().padLeft(2, '0')}:${widget.user.updatedAt.second.toString().padLeft(2, '0')}',
                icon: Icons.update,
                readOnly: true,
              ),
              if (_isEditing) ...[
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            _isEditing = false;
                            _nameController.text = widget.user.name;
                            _surnameController.text = widget.user.surname;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.grey),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Annulla',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          final updatedUser = User(
                            uid: widget.user.uid,
                            name: _nameController.text,
                            surname: _surnameController.text,
                            email: widget.user.email,
                            passwordHash: widget.user.passwordHash,
                            createdAt: widget.user.createdAt,
                            updatedAt: DateTime.now(),
                          );
                          context.read<UserBloc>().add(
                            UpdateUser(widget.user.uid, updatedUser),
                          );
                          context.read<UserBloc>().add(
                            LoadUsers(),
                          ); // Ensure state is refreshed
                          setState(() {
                            _isEditing = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Profilo aggiornato con successo'),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.pop(context); // Go back to profile screen
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF667EEA),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                          shadowColor: Colors.black.withValues(alpha: 0.2),
                        ),
                        child: const Text(
                          'Salva',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoField({
    required String label,
    String? value,
    TextEditingController? controller,
    required IconData icon,
    bool readOnly = false,
  }) {
    if (_isEditing && controller != null) {
      return TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
          hintText: label,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          prefixIcon: Icon(icon, color: Colors.grey.shade600),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF667EEA), width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Inserisci $label';
          }
          return null;
        },
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey.shade600),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF2D3748),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
