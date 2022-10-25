.class public interface abstract Lcom/vkontakte/android/data/Messages$GetDialogsCallback;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/data/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "GetDialogsCallback"
.end annotation


# virtual methods
.method public abstract onDialogsLoaded(Ljava/util/ArrayList;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/DialogEntry;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onError(ILjava/lang/String;)V
.end method
