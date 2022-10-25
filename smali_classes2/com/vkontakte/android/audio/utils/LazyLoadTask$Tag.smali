.class Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;
.super Ljava/lang/Object;
.source "LazyLoadTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/utils/LazyLoadTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Tag"
.end annotation


# instance fields
.field public final key:Ljava/lang/String;

.field public task:Lcom/vkontakte/android/audio/utils/LazyLoadTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/audio/utils/LazyLoadTask",
            "<***>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 178
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 179
    iput-object p1, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;->key:Ljava/lang/String;

    .line 180
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/vkontakte/android/audio/utils/LazyLoadTask;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/vkontakte/android/audio/utils/LazyLoadTask",
            "<***>;)V"
        }
    .end annotation

    .prologue
    .line 173
    .local p2, "task":Lcom/vkontakte/android/audio/utils/LazyLoadTask;, "Lcom/vkontakte/android/audio/utils/LazyLoadTask<***>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 174
    iput-object p1, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;->key:Ljava/lang/String;

    .line 175
    iput-object p2, p0, Lcom/vkontakte/android/audio/utils/LazyLoadTask$Tag;->task:Lcom/vkontakte/android/audio/utils/LazyLoadTask;

    .line 176
    return-void
.end method
