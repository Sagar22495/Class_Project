# Generated by Django 3.2 on 2021-06-16 08:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0002_auto_20210615_1627'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pid', models.IntegerField(default=0)),
                ('uid', models.IntegerField(default=0)),
            ],
        ),
    ]
