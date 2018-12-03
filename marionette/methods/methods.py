from functools import partial
from .authors import authors
from .followers import followers
from .followinf import following
from .user_feed import user_feed

methods = {'authors': authors,
           'followers': followers,
           'following': following,
           'user_feed': user_feed,
           }


def make_methods(bot):
    return {key: partial(value, bot) for (key, value) in methods.items()}
