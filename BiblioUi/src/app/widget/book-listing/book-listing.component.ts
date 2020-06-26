import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {LivreData} from '../../data/livre-data';

@Component({
  selector: 'app-book-listing',
  templateUrl: './book-listing.component.html',
  styleUrls: ['./book-listing.component.scss']
})
export class BookListingComponent implements OnInit {
  @Input() livre: LivreData;
  @Output() selected = new EventEmitter<LivreData>();

  constructor() { }

  ngOnInit(): void {
  }

  select(livre: LivreData) {
      this.selected.emit(livre);
  }
}
