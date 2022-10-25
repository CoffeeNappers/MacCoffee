.class Lio/sentry/util/CircularFifoQueue$1;
.super Ljava/lang/Object;
.source "CircularFifoQueue.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/sentry/util/CircularFifoQueue;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<TE;>;"
    }
.end annotation


# instance fields
.field private index:I

.field private isFirst:Z

.field private lastReturnedIndex:I

.field final synthetic this$0:Lio/sentry/util/CircularFifoQueue;


# direct methods
.method constructor <init>(Lio/sentry/util/CircularFifoQueue;)V
    .locals 1

    .prologue
    .line 364
    .local p0, "this":Lio/sentry/util/CircularFifoQueue$1;, "Lio/sentry/util/CircularFifoQueue.1;"
    iput-object p1, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 366
    iget-object v0, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-static {v0}, Lio/sentry/util/CircularFifoQueue;->access$000(Lio/sentry/util/CircularFifoQueue;)I

    move-result v0

    iput v0, p0, Lio/sentry/util/CircularFifoQueue$1;->index:I

    .line 367
    const/4 v0, -0x1

    iput v0, p0, Lio/sentry/util/CircularFifoQueue$1;->lastReturnedIndex:I

    .line 368
    iget-object v0, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-static {v0}, Lio/sentry/util/CircularFifoQueue;->access$100(Lio/sentry/util/CircularFifoQueue;)Z

    move-result v0

    iput-boolean v0, p0, Lio/sentry/util/CircularFifoQueue$1;->isFirst:Z

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 372
    .local p0, "this":Lio/sentry/util/CircularFifoQueue$1;, "Lio/sentry/util/CircularFifoQueue.1;"
    iget-boolean v0, p0, Lio/sentry/util/CircularFifoQueue$1;->isFirst:Z

    if-nez v0, :cond_0

    iget v0, p0, Lio/sentry/util/CircularFifoQueue$1;->index:I

    iget-object v1, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-static {v1}, Lio/sentry/util/CircularFifoQueue;->access$200(Lio/sentry/util/CircularFifoQueue;)I

    move-result v1

    if-eq v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public next()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 377
    .local p0, "this":Lio/sentry/util/CircularFifoQueue$1;, "Lio/sentry/util/CircularFifoQueue.1;"
    invoke-virtual {p0}, Lio/sentry/util/CircularFifoQueue$1;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 378
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 380
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/sentry/util/CircularFifoQueue$1;->isFirst:Z

    .line 381
    iget v0, p0, Lio/sentry/util/CircularFifoQueue$1;->index:I

    iput v0, p0, Lio/sentry/util/CircularFifoQueue$1;->lastReturnedIndex:I

    .line 382
    iget-object v0, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    iget v1, p0, Lio/sentry/util/CircularFifoQueue$1;->index:I

    invoke-static {v0, v1}, Lio/sentry/util/CircularFifoQueue;->access$300(Lio/sentry/util/CircularFifoQueue;I)I

    move-result v0

    iput v0, p0, Lio/sentry/util/CircularFifoQueue$1;->index:I

    .line 383
    iget-object v0, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-static {v0}, Lio/sentry/util/CircularFifoQueue;->access$400(Lio/sentry/util/CircularFifoQueue;)[Ljava/lang/Object;

    move-result-object v0

    iget v1, p0, Lio/sentry/util/CircularFifoQueue$1;->lastReturnedIndex:I

    aget-object v0, v0, v1

    return-object v0
.end method

.method public remove()V
    .locals 7

    .prologue
    .local p0, "this":Lio/sentry/util/CircularFifoQueue$1;, "Lio/sentry/util/CircularFifoQueue.1;"
    const/4 v6, 0x0

    const/4 v5, -0x1

    .line 388
    iget v1, p0, Lio/sentry/util/CircularFifoQueue$1;->lastReturnedIndex:I

    if-ne v1, v5, :cond_0

    .line 389
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 393
    :cond_0
    iget v1, p0, Lio/sentry/util/CircularFifoQueue$1;->lastReturnedIndex:I

    iget-object v2, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-static {v2}, Lio/sentry/util/CircularFifoQueue;->access$000(Lio/sentry/util/CircularFifoQueue;)I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 394
    iget-object v1, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-virtual {v1}, Lio/sentry/util/CircularFifoQueue;->remove()Ljava/lang/Object;

    .line 395
    iput v5, p0, Lio/sentry/util/CircularFifoQueue$1;->lastReturnedIndex:I

    .line 421
    :goto_0
    return-void

    .line 399
    :cond_1
    iget v1, p0, Lio/sentry/util/CircularFifoQueue$1;->lastReturnedIndex:I

    add-int/lit8 v0, v1, 0x1

    .line 400
    .local v0, "pos":I
    iget-object v1, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-static {v1}, Lio/sentry/util/CircularFifoQueue;->access$000(Lio/sentry/util/CircularFifoQueue;)I

    move-result v1

    iget v2, p0, Lio/sentry/util/CircularFifoQueue$1;->lastReturnedIndex:I

    if-ge v1, v2, :cond_3

    iget-object v1, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-static {v1}, Lio/sentry/util/CircularFifoQueue;->access$200(Lio/sentry/util/CircularFifoQueue;)I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 402
    iget-object v1, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-static {v1}, Lio/sentry/util/CircularFifoQueue;->access$400(Lio/sentry/util/CircularFifoQueue;)[Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-static {v2}, Lio/sentry/util/CircularFifoQueue;->access$400(Lio/sentry/util/CircularFifoQueue;)[Ljava/lang/Object;

    move-result-object v2

    iget v3, p0, Lio/sentry/util/CircularFifoQueue$1;->lastReturnedIndex:I

    iget-object v4, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-static {v4}, Lio/sentry/util/CircularFifoQueue;->access$200(Lio/sentry/util/CircularFifoQueue;)I

    move-result v4

    sub-int/2addr v4, v0

    invoke-static {v1, v0, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 416
    :cond_2
    iput v5, p0, Lio/sentry/util/CircularFifoQueue$1;->lastReturnedIndex:I

    .line 417
    iget-object v1, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    iget-object v2, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    iget-object v3, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-static {v3}, Lio/sentry/util/CircularFifoQueue;->access$200(Lio/sentry/util/CircularFifoQueue;)I

    move-result v3

    invoke-static {v2, v3}, Lio/sentry/util/CircularFifoQueue;->access$600(Lio/sentry/util/CircularFifoQueue;I)I

    move-result v2

    invoke-static {v1, v2}, Lio/sentry/util/CircularFifoQueue;->access$202(Lio/sentry/util/CircularFifoQueue;I)I

    .line 418
    iget-object v1, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-static {v1}, Lio/sentry/util/CircularFifoQueue;->access$400(Lio/sentry/util/CircularFifoQueue;)[Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-static {v2}, Lio/sentry/util/CircularFifoQueue;->access$200(Lio/sentry/util/CircularFifoQueue;)I

    move-result v2

    const/4 v3, 0x0

    aput-object v3, v1, v2

    .line 419
    iget-object v1, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-static {v1, v6}, Lio/sentry/util/CircularFifoQueue;->access$102(Lio/sentry/util/CircularFifoQueue;Z)Z

    .line 420
    iget-object v1, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    iget v2, p0, Lio/sentry/util/CircularFifoQueue$1;->index:I

    invoke-static {v1, v2}, Lio/sentry/util/CircularFifoQueue;->access$600(Lio/sentry/util/CircularFifoQueue;I)I

    move-result v1

    iput v1, p0, Lio/sentry/util/CircularFifoQueue$1;->index:I

    goto :goto_0

    .line 405
    :cond_3
    :goto_1
    iget-object v1, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-static {v1}, Lio/sentry/util/CircularFifoQueue;->access$200(Lio/sentry/util/CircularFifoQueue;)I

    move-result v1

    if-eq v0, v1, :cond_2

    .line 406
    iget-object v1, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-static {v1}, Lio/sentry/util/CircularFifoQueue;->access$500(Lio/sentry/util/CircularFifoQueue;)I

    move-result v1

    if-lt v0, v1, :cond_4

    .line 407
    iget-object v1, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-static {v1}, Lio/sentry/util/CircularFifoQueue;->access$400(Lio/sentry/util/CircularFifoQueue;)[Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v2, v0, -0x1

    iget-object v3, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-static {v3}, Lio/sentry/util/CircularFifoQueue;->access$400(Lio/sentry/util/CircularFifoQueue;)[Ljava/lang/Object;

    move-result-object v3

    aget-object v3, v3, v6

    aput-object v3, v1, v2

    .line 408
    const/4 v0, 0x0

    goto :goto_1

    .line 410
    :cond_4
    iget-object v1, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-static {v1}, Lio/sentry/util/CircularFifoQueue;->access$400(Lio/sentry/util/CircularFifoQueue;)[Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-static {v2, v0}, Lio/sentry/util/CircularFifoQueue;->access$600(Lio/sentry/util/CircularFifoQueue;I)I

    move-result v2

    iget-object v3, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-static {v3}, Lio/sentry/util/CircularFifoQueue;->access$400(Lio/sentry/util/CircularFifoQueue;)[Ljava/lang/Object;

    move-result-object v3

    aget-object v3, v3, v0

    aput-object v3, v1, v2

    .line 411
    iget-object v1, p0, Lio/sentry/util/CircularFifoQueue$1;->this$0:Lio/sentry/util/CircularFifoQueue;

    invoke-static {v1, v0}, Lio/sentry/util/CircularFifoQueue;->access$300(Lio/sentry/util/CircularFifoQueue;I)I

    move-result v0

    goto :goto_1
.end method
