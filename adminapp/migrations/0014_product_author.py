# Generated by Django 3.2 on 2021-06-10 18:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adminapp', '0013_delete_userdata'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='author',
            field=models.CharField(default='None', max_length=60),
        ),
    ]
