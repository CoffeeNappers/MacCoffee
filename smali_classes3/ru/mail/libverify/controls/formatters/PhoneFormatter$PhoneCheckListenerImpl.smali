.class Lru/mail/libverify/controls/formatters/PhoneFormatter$PhoneCheckListenerImpl;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/api/VerificationApi$PhoneCheckListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/controls/formatters/PhoneFormatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PhoneCheckListenerImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lru/mail/libverify/controls/formatters/PhoneFormatter;


# direct methods
.method private constructor <init>(Lru/mail/libverify/controls/formatters/PhoneFormatter;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter$PhoneCheckListenerImpl;->this$0:Lru/mail/libverify/controls/formatters/PhoneFormatter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lru/mail/libverify/controls/formatters/PhoneFormatter;Lru/mail/libverify/controls/formatters/PhoneFormatter$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lru/mail/libverify/controls/formatters/PhoneFormatter$PhoneCheckListenerImpl;-><init>(Lru/mail/libverify/controls/formatters/PhoneFormatter;)V

    return-void
.end method


# virtual methods
.method public onCompleted(Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lru/mail/libverify/controls/Utils;->uiHandler:Landroid/os/Handler;

    new-instance v1, Lru/mail/libverify/controls/formatters/PhoneFormatter$PhoneCheckListenerImpl$1;

    invoke-direct {v1, p0, p1, p2}, Lru/mail/libverify/controls/formatters/PhoneFormatter$PhoneCheckListenerImpl$1;-><init>(Lru/mail/libverify/controls/formatters/PhoneFormatter$PhoneCheckListenerImpl;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$PhoneCheckResult;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
