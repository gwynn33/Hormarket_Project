from blueprints.database.models import Product
from blueprints.database import get_session 
from flask import Blueprint
import click
import traceback

p_cmd_bp = Blueprint("p_cmd_bp",__name__)

@p_cmd_bp.cli.command('add_product')
@click.argument('identifier',type=int)
@click.argument('p_name',required=True)
@click.argument('p_categorie',required=True)
@click.argument('p_price',required=True)
@click.argument('p_current_stock_history',required=True)
@click.argument('p_entering_date',required=True)
@click.argument('p_expiration_date')
def add_product(identifier,p_name,p_categorie,p_price,p_current_stock_history,p_entering_date,p_expiration_date):
    try:
        with get_session() as session:
            product_info = Product(
                product_id = identifier,
                product_name = p_name,
                product_categorie = p_categorie,
                product_price = p_price,
                current_stock_history = p_current_stock_history,
                product_entering_date = p_entering_date,
                product_expiration_date = p_expiration_date
            )

        session.add(product_info)
        session.commit()
        click.echo("Done!")
    except Exception as e:
        session.rollback()
        click.echo(f"Error: {e}")
        click.echo(f"Detailled Error: ")
        traceback.print_exc()