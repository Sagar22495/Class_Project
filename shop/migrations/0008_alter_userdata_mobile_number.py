# Generated by Django 3.2 on 2021-06-23 07:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0007_alter_userdata_mobile_number'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userdata',
            name='mobile_number',
            field=models.BigIntegerField(default=0),
        ),
    ]
