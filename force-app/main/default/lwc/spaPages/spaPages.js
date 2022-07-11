import { LightningElement, api } from 'lwc';
import { PAGE_ID_TO_TEMPLATE } from './pagesConfig';

export default class SpaPages extends LightningElement {
    @api selectedPageId;

    render() {
        return PAGE_ID_TO_TEMPLATE[this.selectedPageId] || PAGE_ID_TO_TEMPLATE['notFound'];
    }
}
