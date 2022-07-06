import { LightningElement, api, wire, track } from 'lwc';
import { NavigationMixin, CurrentPageReference } from 'lightning/navigation';

export default class SpaNavigation extends NavigationMixin(LightningElement) {

    @api selectedPageId;
    @api pagesConfig;

    @track menuItems;

    @wire(CurrentPageReference)
    getStateParameters(currentPageReference) {
        if (!currentPageReference) {
            return;
        }

        this.currentPageReference = currentPageReference;
    }

    connectedCallback() {
        this.init();
    }

    init() {
        this.menuItems = this.pagesConfig.map(page => ({
            label: page.name,
            urlParam: page.urlParam,
            isCurrent: page.pageId === this.selectedPageId
        }))
    }

    handleNavigation(event) {
        this[NavigationMixin.Navigate](
            Object.assign({}, this.currentPageReference, {
                state: Object.assign({}, this.currentPageReference.state, {
                    c__page: event.target.dataset.page
                })
            }),
            false
        );
    }
}
