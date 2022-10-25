.class public final Lio/reactivex/exceptions/CompositeException;
.super Ljava/lang/RuntimeException;
.source "CompositeException.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/exceptions/CompositeException$CompositeExceptionCausalChain;,
        Lio/reactivex/exceptions/CompositeException$WrappedPrintWriter;,
        Lio/reactivex/exceptions/CompositeException$WrappedPrintStream;,
        Lio/reactivex/exceptions/CompositeException$PrintStreamOrWriter;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x29ffcc6947b49592L


# instance fields
.field private cause:Ljava/lang/Throwable;

.field private final exceptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field private final message:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Iterable;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 62
    .local p1, "errors":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Ljava/lang/Throwable;>;"
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 63
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 64
    .local v0, "deDupedExceptions":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Throwable;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 65
    .local v3, "localExceptions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    if-eqz p1, :cond_2

    .line 66
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Throwable;

    .line 67
    .local v1, "ex":Ljava/lang/Throwable;
    instance-of v4, v1, Lio/reactivex/exceptions/CompositeException;

    if-eqz v4, :cond_0

    .line 68
    check-cast v1, Lio/reactivex/exceptions/CompositeException;

    .end local v1    # "ex":Ljava/lang/Throwable;
    invoke-virtual {v1}, Lio/reactivex/exceptions/CompositeException;->getExceptions()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 70
    .restart local v1    # "ex":Ljava/lang/Throwable;
    :cond_0
    if-eqz v1, :cond_1

    .line 71
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 73
    :cond_1
    new-instance v4, Ljava/lang/NullPointerException;

    const-string/jumbo v5, "Throwable was null!"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 77
    .end local v1    # "ex":Ljava/lang/Throwable;
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_2
    new-instance v4, Ljava/lang/NullPointerException;

    const-string/jumbo v5, "errors was null"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 79
    :cond_3
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 80
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v5, "errors is empty"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 82
    :cond_4
    invoke-interface {v3, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 83
    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    iput-object v4, p0, Lio/reactivex/exceptions/CompositeException;->exceptions:Ljava/util/List;

    .line 84
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lio/reactivex/exceptions/CompositeException;->exceptions:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " exceptions occurred. "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lio/reactivex/exceptions/CompositeException;->message:Ljava/lang/String;

    .line 85
    return-void
.end method

.method public varargs constructor <init>([Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "exceptions"    # [Ljava/lang/Throwable;

    .prologue
    .line 51
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "exceptions was null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    :goto_0
    invoke-direct {p0, v0}, Lio/reactivex/exceptions/CompositeException;-><init>(Ljava/lang/Iterable;)V

    .line 53
    return-void

    .line 51
    :cond_0
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method private appendStackTrace(Ljava/lang/StringBuilder;Ljava/lang/Throwable;Ljava/lang/String;)V
    .locals 6
    .param p1, "b"    # Ljava/lang/StringBuilder;
    .param p2, "ex"    # Ljava/lang/Throwable;
    .param p3, "prefix"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0xa

    .line 190
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 191
    invoke-virtual {p2}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/StackTraceElement;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 192
    .local v3, "stackElement":Ljava/lang/StackTraceElement;
    const-string/jumbo v4, "\t\tat "

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 191
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 194
    .end local v3    # "stackElement":Ljava/lang/StackTraceElement;
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 195
    const-string/jumbo v4, "\tCaused by: "

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    invoke-virtual {p2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    const-string/jumbo v5, ""

    invoke-direct {p0, p1, v4, v5}, Lio/reactivex/exceptions/CompositeException;->appendStackTrace(Ljava/lang/StringBuilder;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 198
    :cond_1
    return-void
.end method

.method private getListOfCauses(Ljava/lang/Throwable;)Ljava/util/List;
    .locals 3
    .param p1, "ex"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 245
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 246
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    .line 247
    .local v2, "root":Ljava/lang/Throwable;
    if-eqz v2, :cond_0

    if-ne v2, p1, :cond_2

    .line 254
    :cond_0
    :goto_0
    return-object v1

    .line 256
    .local v0, "cause":Ljava/lang/Throwable;
    :cond_1
    move-object v2, v0

    .line 251
    .end local v0    # "cause":Ljava/lang/Throwable;
    :cond_2
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 252
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 253
    .restart local v0    # "cause":Ljava/lang/Throwable;
    if-eqz v0, :cond_0

    if-ne v0, v2, :cond_1

    goto :goto_0
.end method

.method private getRootCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .locals 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 277
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    .line 278
    .local v1, "root":Ljava/lang/Throwable;
    if-eqz v1, :cond_0

    iget-object v2, p0, Lio/reactivex/exceptions/CompositeException;->cause:Ljava/lang/Throwable;

    if-ne v2, v1, :cond_2

    .line 284
    .end local p1    # "e":Ljava/lang/Throwable;
    :cond_0
    :goto_0
    return-object p1

    .line 286
    .local v0, "cause":Ljava/lang/Throwable;
    .restart local p1    # "e":Ljava/lang/Throwable;
    :cond_1
    move-object v1, v0

    .line 282
    .end local v0    # "cause":Ljava/lang/Throwable;
    :cond_2
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 283
    .restart local v0    # "cause":Ljava/lang/Throwable;
    if-eqz v0, :cond_3

    if-ne v0, v1, :cond_1

    :cond_3
    move-object p1, v1

    .line 284
    goto :goto_0
.end method

.method private printStackTrace(Lio/reactivex/exceptions/CompositeException$PrintStreamOrWriter;)V
    .locals 9
    .param p1, "s"    # Lio/reactivex/exceptions/CompositeException$PrintStreamOrWriter;

    .prologue
    const/16 v8, 0xa

    .line 175
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v7, 0x80

    invoke-direct {v1, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 176
    .local v1, "b":Ljava/lang/StringBuilder;
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 177
    invoke-virtual {p0}, Lio/reactivex/exceptions/CompositeException;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/StackTraceElement;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_0
    if-ge v4, v5, :cond_0

    aget-object v6, v0, v4

    .line 178
    .local v6, "myStackElement":Ljava/lang/StackTraceElement;
    const-string/jumbo v7, "\tat "

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 177
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 180
    .end local v6    # "myStackElement":Ljava/lang/StackTraceElement;
    :cond_0
    const/4 v3, 0x1

    .line 181
    .local v3, "i":I
    iget-object v7, p0, Lio/reactivex/exceptions/CompositeException;->exceptions:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Throwable;

    .line 182
    .local v2, "ex":Ljava/lang/Throwable;
    const-string/jumbo v7, "  ComposedException "

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " :\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    const-string/jumbo v7, "\t"

    invoke-direct {p0, v1, v2, v7}, Lio/reactivex/exceptions/CompositeException;->appendStackTrace(Ljava/lang/StringBuilder;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 184
    add-int/lit8 v3, v3, 0x1

    .line 185
    goto :goto_1

    .line 186
    .end local v2    # "ex":Ljava/lang/Throwable;
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, Lio/reactivex/exceptions/CompositeException$PrintStreamOrWriter;->println(Ljava/lang/Object;)V

    .line 187
    return-void
.end method


# virtual methods
.method public declared-synchronized getCause()Ljava/lang/Throwable;
    .locals 9

    .prologue
    .line 103
    monitor-enter p0

    :try_start_0
    iget-object v8, p0, Lio/reactivex/exceptions/CompositeException;->cause:Ljava/lang/Throwable;

    if-nez v8, :cond_4

    .line 105
    new-instance v6, Lio/reactivex/exceptions/CompositeException$CompositeExceptionCausalChain;

    invoke-direct {v6}, Lio/reactivex/exceptions/CompositeException$CompositeExceptionCausalChain;-><init>()V

    .line 106
    .local v6, "localCause":Lio/reactivex/exceptions/CompositeException$CompositeExceptionCausalChain;
    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    .line 108
    .local v7, "seenCauses":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Throwable;>;"
    move-object v0, v6

    .line 109
    .local v0, "chain":Ljava/lang/Throwable;
    iget-object v8, p0, Lio/reactivex/exceptions/CompositeException;->exceptions:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Throwable;

    .line 110
    .local v2, "e":Ljava/lang/Throwable;
    invoke-interface {v7, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 114
    invoke-interface {v7, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 116
    invoke-direct {p0, v2}, Lio/reactivex/exceptions/CompositeException;->getListOfCauses(Ljava/lang/Throwable;)Ljava/util/List;

    move-result-object v5

    .line 118
    .local v5, "listOfCauses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Throwable;

    .line 119
    .local v1, "child":Ljava/lang/Throwable;
    invoke-interface {v7, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 121
    new-instance v2, Ljava/lang/RuntimeException;

    .end local v2    # "e":Ljava/lang/Throwable;
    const-string/jumbo v8, "Duplicate found in causal chain so cropping to prevent loop ..."

    invoke-direct {v2, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 122
    .restart local v2    # "e":Ljava/lang/Throwable;
    goto :goto_1

    .line 124
    :cond_1
    invoke-interface {v7, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 103
    .end local v0    # "chain":Ljava/lang/Throwable;
    .end local v1    # "child":Ljava/lang/Throwable;
    .end local v2    # "e":Ljava/lang/Throwable;
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v5    # "listOfCauses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .end local v6    # "localCause":Lio/reactivex/exceptions/CompositeException$CompositeExceptionCausalChain;
    .end local v7    # "seenCauses":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Throwable;>;"
    :catchall_0
    move-exception v8

    monitor-exit p0

    throw v8

    .line 129
    .restart local v0    # "chain":Ljava/lang/Throwable;
    .restart local v2    # "e":Ljava/lang/Throwable;
    .restart local v4    # "i$":Ljava/util/Iterator;
    .restart local v5    # "listOfCauses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .restart local v6    # "localCause":Lio/reactivex/exceptions/CompositeException$CompositeExceptionCausalChain;
    .restart local v7    # "seenCauses":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Throwable;>;"
    :cond_2
    :try_start_1
    invoke-virtual {v0, v2}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 135
    :goto_2
    :try_start_2
    invoke-direct {p0, v0}, Lio/reactivex/exceptions/CompositeException;->getRootCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v0

    .line 136
    goto :goto_0

    .line 137
    .end local v2    # "e":Ljava/lang/Throwable;
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v5    # "listOfCauses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :cond_3
    iput-object v6, p0, Lio/reactivex/exceptions/CompositeException;->cause:Ljava/lang/Throwable;

    .line 139
    .end local v0    # "chain":Ljava/lang/Throwable;
    .end local v6    # "localCause":Lio/reactivex/exceptions/CompositeException$CompositeExceptionCausalChain;
    .end local v7    # "seenCauses":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Throwable;>;"
    :cond_4
    iget-object v8, p0, Lio/reactivex/exceptions/CompositeException;->cause:Ljava/lang/Throwable;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object v8

    .line 130
    .restart local v0    # "chain":Ljava/lang/Throwable;
    .restart local v2    # "e":Ljava/lang/Throwable;
    .restart local v4    # "i$":Ljava/util/Iterator;
    .restart local v5    # "listOfCauses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .restart local v6    # "localCause":Lio/reactivex/exceptions/CompositeException$CompositeExceptionCausalChain;
    .restart local v7    # "seenCauses":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Throwable;>;"
    :catch_0
    move-exception v8

    goto :goto_2
.end method

.method public getExceptions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 93
    iget-object v0, p0, Lio/reactivex/exceptions/CompositeException;->exceptions:Ljava/util/List;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lio/reactivex/exceptions/CompositeException;->message:Ljava/lang/String;

    return-object v0
.end method

.method public printStackTrace()V
    .locals 1

    .prologue
    .line 154
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {p0, v0}, Lio/reactivex/exceptions/CompositeException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 155
    return-void
.end method

.method public printStackTrace(Ljava/io/PrintStream;)V
    .locals 1
    .param p1, "s"    # Ljava/io/PrintStream;

    .prologue
    .line 159
    new-instance v0, Lio/reactivex/exceptions/CompositeException$WrappedPrintStream;

    invoke-direct {v0, p1}, Lio/reactivex/exceptions/CompositeException$WrappedPrintStream;-><init>(Ljava/io/PrintStream;)V

    invoke-direct {p0, v0}, Lio/reactivex/exceptions/CompositeException;->printStackTrace(Lio/reactivex/exceptions/CompositeException$PrintStreamOrWriter;)V

    .line 160
    return-void
.end method

.method public printStackTrace(Ljava/io/PrintWriter;)V
    .locals 1
    .param p1, "s"    # Ljava/io/PrintWriter;

    .prologue
    .line 164
    new-instance v0, Lio/reactivex/exceptions/CompositeException$WrappedPrintWriter;

    invoke-direct {v0, p1}, Lio/reactivex/exceptions/CompositeException$WrappedPrintWriter;-><init>(Ljava/io/PrintWriter;)V

    invoke-direct {p0, v0}, Lio/reactivex/exceptions/CompositeException;->printStackTrace(Lio/reactivex/exceptions/CompositeException$PrintStreamOrWriter;)V

    .line 165
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 267
    iget-object v0, p0, Lio/reactivex/exceptions/CompositeException;->exceptions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method
