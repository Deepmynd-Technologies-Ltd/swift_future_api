# Generated by Django 5.1.4 on 2025-01-05 09:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('authentication', '0002_alter_user_fullname'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='pin_created_at',
            field=models.DateTimeField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='user',
            name='wallet_pin',
            field=models.CharField(blank=True, max_length=4, null=True),
        ),
    ]
