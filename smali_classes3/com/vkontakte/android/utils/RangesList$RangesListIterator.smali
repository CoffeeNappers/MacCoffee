.class Lcom/vkontakte/android/utils/RangesList$RangesListIterator;
.super Ljava/lang/Object;
.source "RangesList.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/utils/RangesList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RangesListIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Lcom/vkontakte/android/utils/RangesList$Entry;",
        ">;"
    }
.end annotation


# instance fields
.field currentEntry:Lcom/vkontakte/android/utils/RangesList$Entry;

.field final list:Lcom/vkontakte/android/utils/RangesList;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/utils/RangesList;)V
    .locals 1
    .param p1, "list"    # Lcom/vkontakte/android/utils/RangesList;

    .prologue
    .line 156
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 157
    iput-object p1, p0, Lcom/vkontakte/android/utils/RangesList$RangesListIterator;->list:Lcom/vkontakte/android/utils/RangesList;

    .line 158
    invoke-static {p1}, Lcom/vkontakte/android/utils/RangesList;->access$600(Lcom/vkontakte/android/utils/RangesList;)Lcom/vkontakte/android/utils/RangesList$Entry;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/utils/RangesList$RangesListIterator;->currentEntry:Lcom/vkontakte/android/utils/RangesList$Entry;

    .line 159
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lcom/vkontakte/android/utils/RangesList$RangesListIterator;->currentEntry:Lcom/vkontakte/android/utils/RangesList$Entry;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public next()Lcom/vkontakte/android/utils/RangesList$Entry;
    .locals 2

    .prologue
    .line 168
    iget-object v0, p0, Lcom/vkontakte/android/utils/RangesList$RangesListIterator;->currentEntry:Lcom/vkontakte/android/utils/RangesList$Entry;

    .line 169
    .local v0, "entryToReturn":Lcom/vkontakte/android/utils/RangesList$Entry;
    iget-object v1, p0, Lcom/vkontakte/android/utils/RangesList$RangesListIterator;->currentEntry:Lcom/vkontakte/android/utils/RangesList$Entry;

    if-eqz v1, :cond_0

    .line 170
    iget-object v1, p0, Lcom/vkontakte/android/utils/RangesList$RangesListIterator;->currentEntry:Lcom/vkontakte/android/utils/RangesList$Entry;

    invoke-virtual {v1}, Lcom/vkontakte/android/utils/RangesList$Entry;->next()Lcom/vkontakte/android/utils/RangesList$Entry;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/utils/RangesList$RangesListIterator;->currentEntry:Lcom/vkontakte/android/utils/RangesList$Entry;

    .line 172
    :cond_0
    return-object v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 152
    invoke-virtual {p0}, Lcom/vkontakte/android/utils/RangesList$RangesListIterator;->next()Lcom/vkontakte/android/utils/RangesList$Entry;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 2

    .prologue
    .line 177
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "RangesList#iterator() does not support remove()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
