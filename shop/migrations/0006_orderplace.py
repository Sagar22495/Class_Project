# Generated by Django 3.2 on 2021-06-17 14:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0005_auto_20210617_0136'),
    ]

    operations = [
        migrations.CreateModel(
            name='Orderplace',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pid', models.IntegerField()),
                ('uid', models.IntegerField()),
                ('qty', models.IntegerField()),
                ('price', models.IntegerField()),
            ],
        ),
    ]
