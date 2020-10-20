##########
oomox-i3ch
##########

|License: MIT|

Personalized oomox theme created using |oomox|_ with i3ch colours.

Usage
======

Use |oomox|_ to edit, and ensure it is installed to ``/opt/oomox`` (or
override the location in the ``$OOMOX`` variable.

To build the themes and icons, run::

	make
	OOMOX=/path/to/oomox make # if your oomox is not in /opt/oomox

To build the debian package, run::

	debuild -us -uc -b

Dependencies
============

* |oomox|_

.. |License: MIT| image:: https://img.shields.io/badge/License-MIT-yellow.svg
	:target: https://opensource.org/licenses/MIT

.. |oomox| replace:: oomox
.. _oomox: https://github.com/themix-project/oomox
