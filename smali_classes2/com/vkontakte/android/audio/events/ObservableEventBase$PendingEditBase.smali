.class abstract Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase;
.super Ljava/lang/Object;
.source "ObservableEventBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/events/ObservableEventBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "PendingEditBase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Handler:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected final argument:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "THandler;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(THandler;)V"
        }
    .end annotation

    .prologue
    .line 69
    .local p0, "this":Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase;, "Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase<THandler;>;"
    .local p1, "argument":Ljava/lang/Object;, "THandler;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput-object p1, p0, Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase;->argument:Ljava/lang/Object;

    .line 71
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/Object;Lcom/vkontakte/android/audio/events/ObservableEventBase$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Lcom/vkontakte/android/audio/events/ObservableEventBase$1;

    .prologue
    .line 66
    .local p0, "this":Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase;, "Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase<THandler;>;"
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/events/ObservableEventBase$PendingEditBase;-><init>(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public abstract run(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<THandler;>;)V"
        }
    .end annotation
.end method
