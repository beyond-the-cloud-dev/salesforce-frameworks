import home from './pages/home.html';
import contact from './pages/contact.html';
import about from './pages/about.html';
import services from './pages/services.html';
import notFound from './pages/404.html';

const PAGE_ID_TO_TEMPLATE = {
    'home': home,
    'contact': contact,
    'about': about,
    'services': services,
    'notFound': notFound
};

export { PAGE_ID_TO_TEMPLATE };
