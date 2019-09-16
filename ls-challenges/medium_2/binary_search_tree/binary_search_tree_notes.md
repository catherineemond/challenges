### Another use of recursion:

```ruby
def to_a
    [left.to_a, data, right.to_a].flatten
  end
```

### Use of the lonely operator:

```ruby
left&.each(&block)
```

instead of:

```ruby
left.each(&block) if left
```

### Implicit vs Explicit block:

```ruby
left&.each(&block)
```

or:

```ruby
@left &.each { |item| yield item }
```

### Not sure why this line is working?

```ruby
return to_enum(:each) unless block_given?
```
From the comments at : https://blog.arkency.com/2014/01/ruby-to-enum-for-enumerator/

I am trying to wrap my head around the guard clause. It is returning the very same each method it's in as the enum method? So how does the code ever get past the guard clause?

Answer:

to_enum(:method) is returning an Enumerator object which knows that it needs to call #method with block, to enumerate the collection. Enumerator will pass a block to the method and thus skip the guard.
