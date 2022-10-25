.class public Lcom/vkontakte/android/audio/utils/BoundService$Binder;
.super Landroid/os/Binder;
.source "BoundService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/utils/BoundService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Binder"
.end annotation


# instance fields
.field public final service:Lcom/vkontakte/android/audio/utils/BoundService;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/audio/utils/BoundService;)V
    .locals 0
    .param p1, "service"    # Lcom/vkontakte/android/audio/utils/BoundService;

    .prologue
    .line 97
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 98
    iput-object p1, p0, Lcom/vkontakte/android/audio/utils/BoundService$Binder;->service:Lcom/vkontakte/android/audio/utils/BoundService;

    .line 99
    return-void
.end method
