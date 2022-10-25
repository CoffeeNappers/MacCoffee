.class Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingRemoving;
.super Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase;
.source "ObservableEventBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/events/ObservableEventBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PendingRemoving"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Handler:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase",
        "<THandler;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(THandler;)V"
        }
    .end annotation

    .prologue
    .line 89
    .local p0, "this":Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingRemoving;, "Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingRemoving<THandler;>;"
    .local p1, "argument":Ljava/lang/Object;, "THandler;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase;-><init>(Ljava/lang/Object;Lcom/vkontakte/android/audio/events/ObservableEventBase$1;)V

    .line 90
    return-void
.end method


# virtual methods
.method public run(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<THandler;>;)V"
        }
    .end annotation

    .prologue
    .line 94
    .local p0, "this":Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingRemoving;, "Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingRemoving<THandler;>;"
    .local p1, "collection":Ljava/util/List;, "Ljava/util/List<THandler;>;"
    iget-object v0, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingRemoving;->argument:Ljava/lang/Object;

    invoke-interface {p1, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 95
    return-void
.end method
