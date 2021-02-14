// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hacker_news_item.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HackerNewsItem> _$hackerNewsItemSerializer =
    new _$HackerNewsItemSerializer();

class _$HackerNewsItemSerializer
    implements StructuredSerializer<HackerNewsItem> {
  @override
  final Iterable<Type> types = const [HackerNewsItem, _$HackerNewsItem];
  @override
  final String wireName = 'HackerNewsItem';

  @override
  Iterable<Object> serialize(Serializers serializers, HackerNewsItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'time',
      serializers.serialize(object.time, specifiedType: const FullType(int)),
      'by',
      serializers.serialize(object.by, specifiedType: const FullType(String)),
      'kids',
      serializers.serialize(object.kids,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'parts',
      serializers.serialize(object.parts,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
    ];
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(String)));
    }
    if (object.text != null) {
      result
        ..add('text')
        ..add(serializers.serialize(object.text,
            specifiedType: const FullType(String)));
    }
    if (object.url != null) {
      result
        ..add('url')
        ..add(serializers.serialize(object.url,
            specifiedType: const FullType(String)));
    }
    if (object.parent != null) {
      result
        ..add('parent')
        ..add(serializers.serialize(object.parent,
            specifiedType: const FullType(int)));
    }
    if (object.descendants != null) {
      result
        ..add('descendants')
        ..add(serializers.serialize(object.descendants,
            specifiedType: const FullType(int)));
    }
    if (object.score != null) {
      result
        ..add('score')
        ..add(serializers.serialize(object.score,
            specifiedType: const FullType(int)));
    }
    if (object.poll != null) {
      result
        ..add('poll')
        ..add(serializers.serialize(object.poll,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  HackerNewsItem deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HackerNewsItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'by':
          result.by = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'parent':
          result.parent = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'kids':
          result.kids.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<Object>);
          break;
        case 'descendants':
          result.descendants = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'score':
          result.score = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'poll':
          result.poll = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'parts':
          result.parts.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$HackerNewsItem extends HackerNewsItem {
  @override
  final int id;
  @override
  final String type;
  @override
  final int time;
  @override
  final String by;
  @override
  final String title;
  @override
  final String text;
  @override
  final String url;
  @override
  final int parent;
  @override
  final BuiltList<int> kids;
  @override
  final int descendants;
  @override
  final int score;
  @override
  final int poll;
  @override
  final BuiltList<int> parts;

  factory _$HackerNewsItem([void Function(HackerNewsItemBuilder) updates]) =>
      (new HackerNewsItemBuilder()..update(updates)).build();

  _$HackerNewsItem._(
      {this.id,
      this.type,
      this.time,
      this.by,
      this.title,
      this.text,
      this.url,
      this.parent,
      this.kids,
      this.descendants,
      this.score,
      this.poll,
      this.parts})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('HackerNewsItem', 'id');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('HackerNewsItem', 'type');
    }
    if (time == null) {
      throw new BuiltValueNullFieldError('HackerNewsItem', 'time');
    }
    if (by == null) {
      throw new BuiltValueNullFieldError('HackerNewsItem', 'by');
    }
    if (kids == null) {
      throw new BuiltValueNullFieldError('HackerNewsItem', 'kids');
    }
    if (parts == null) {
      throw new BuiltValueNullFieldError('HackerNewsItem', 'parts');
    }
  }

  @override
  HackerNewsItem rebuild(void Function(HackerNewsItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HackerNewsItemBuilder toBuilder() =>
      new HackerNewsItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HackerNewsItem &&
        id == other.id &&
        type == other.type &&
        time == other.time &&
        by == other.by &&
        title == other.title &&
        text == other.text &&
        url == other.url &&
        parent == other.parent &&
        kids == other.kids &&
        descendants == other.descendants &&
        score == other.score &&
        poll == other.poll &&
        parts == other.parts;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, id.hashCode),
                                                    type.hashCode),
                                                time.hashCode),
                                            by.hashCode),
                                        title.hashCode),
                                    text.hashCode),
                                url.hashCode),
                            parent.hashCode),
                        kids.hashCode),
                    descendants.hashCode),
                score.hashCode),
            poll.hashCode),
        parts.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HackerNewsItem')
          ..add('id', id)
          ..add('type', type)
          ..add('time', time)
          ..add('by', by)
          ..add('title', title)
          ..add('text', text)
          ..add('url', url)
          ..add('parent', parent)
          ..add('kids', kids)
          ..add('descendants', descendants)
          ..add('score', score)
          ..add('poll', poll)
          ..add('parts', parts))
        .toString();
  }
}

class HackerNewsItemBuilder
    implements Builder<HackerNewsItem, HackerNewsItemBuilder> {
  _$HackerNewsItem _$v;

  int _id;

  int get id => _$this._id;

  set id(int id) => _$this._id = id;

  String _type;

  String get type => _$this._type;

  set type(String type) => _$this._type = type;

  int _time;

  int get time => _$this._time;

  set time(int time) => _$this._time = time;

  String _by;

  String get by => _$this._by;

  set by(String by) => _$this._by = by;

  String _title;

  String get title => _$this._title;

  set title(String title) => _$this._title = title;

  String _text;

  String get text => _$this._text;

  set text(String text) => _$this._text = text;

  String _url;

  String get url => _$this._url;

  set url(String url) => _$this._url = url;

  int _parent;

  int get parent => _$this._parent;

  set parent(int parent) => _$this._parent = parent;

  ListBuilder<int> _kids;

  ListBuilder<int> get kids => _$this._kids ??= new ListBuilder<int>();

  set kids(ListBuilder<int> kids) => _$this._kids = kids;

  int _descendants;

  int get descendants => _$this._descendants;

  set descendants(int descendants) => _$this._descendants = descendants;

  int _score;

  int get score => _$this._score;

  set score(int score) => _$this._score = score;

  int _poll;

  int get poll => _$this._poll;

  set poll(int poll) => _$this._poll = poll;

  ListBuilder<int> _parts;

  ListBuilder<int> get parts => _$this._parts ??= new ListBuilder<int>();

  set parts(ListBuilder<int> parts) => _$this._parts = parts;

  HackerNewsItemBuilder();

  HackerNewsItemBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _type = _$v.type;
      _time = _$v.time;
      _by = _$v.by;
      _title = _$v.title;
      _text = _$v.text;
      _url = _$v.url;
      _parent = _$v.parent;
      _kids = _$v.kids?.toBuilder();
      _descendants = _$v.descendants;
      _score = _$v.score;
      _poll = _$v.poll;
      _parts = _$v.parts?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HackerNewsItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HackerNewsItem;
  }

  @override
  void update(void Function(HackerNewsItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HackerNewsItem build() {
    _$HackerNewsItem _$result;
    try {
      _$result = _$v ??
          new _$HackerNewsItem._(
              id: id,
              type: type,
              time: time,
              by: by,
              title: title,
              text: text,
              url: url,
              parent: parent,
              kids: kids.build(),
              descendants: descendants,
              score: score,
              poll: poll,
              parts: parts.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'kids';
        kids.build();

        _$failedField = 'parts';
        parts.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HackerNewsItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
