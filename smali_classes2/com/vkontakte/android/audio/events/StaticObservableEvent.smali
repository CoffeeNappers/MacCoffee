.class public abstract Lcom/vkontakte/android/audio/events/StaticObservableEvent;
.super Lcom/vkontakte/android/audio/events/ObservableEventBase;
.source "StaticObservableEvent.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Handler:",
        "Ljava/lang/Object;",
        "Sender:",
        "Ljava/lang/Object;",
        "Argument:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/vkontakte/android/audio/events/ObservableEventBase",
        "<THandler;TSender;TArgument;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    .local p0, "this":Lcom/vkontakte/android/audio/events/StaticObservableEvent;, "Lcom/vkontakte/android/audio/events/StaticObservableEvent<THandler;TSender;TArgument;>;"
    invoke-direct {p0}, Lcom/vkontakte/android/audio/events/ObservableEventBase;-><init>()V

    return-void
.end method


# virtual methods
.method public fire(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TSender;TArgument;)V"
        }
    .end annotation

    .prologue
    .line 8
    .local p0, "this":Lcom/vkontakte/android/audio/events/StaticObservableEvent;, "Lcom/vkontakte/android/audio/events/StaticObservableEvent<THandler;TSender;TArgument;>;"
    .local p1, "sender":Ljava/lang/Object;, "TSender;"
    .local p2, "args":Ljava/lang/Object;, "TArgument;"
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/audio/events/ObservableEventBase;->fire(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 9
    return-void
.end method
