.class Lru/mail/libverify/controls/VerificationController$PhoneAccountSearchListener$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/controls/VerificationController$PhoneAccountSearchListener;->onComplete(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lru/mail/libverify/controls/VerificationController$PhoneAccountSearchListener;

.field final synthetic val$accounts:Ljava/util/List;


# direct methods
.method constructor <init>(Lru/mail/libverify/controls/VerificationController$PhoneAccountSearchListener;Ljava/util/List;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/controls/VerificationController$PhoneAccountSearchListener$1;->this$1:Lru/mail/libverify/controls/VerificationController$PhoneAccountSearchListener;

    iput-object p2, p0, Lru/mail/libverify/controls/VerificationController$PhoneAccountSearchListener$1;->val$accounts:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController$PhoneAccountSearchListener$1;->this$1:Lru/mail/libverify/controls/VerificationController$PhoneAccountSearchListener;

    iget-object v0, v0, Lru/mail/libverify/controls/VerificationController$PhoneAccountSearchListener;->this$0:Lru/mail/libverify/controls/VerificationController;

    iget-object v1, p0, Lru/mail/libverify/controls/VerificationController$PhoneAccountSearchListener$1;->val$accounts:Ljava/util/List;

    invoke-static {v0, v1}, Lru/mail/libverify/controls/VerificationController;->access$302(Lru/mail/libverify/controls/VerificationController;Ljava/util/List;)Ljava/util/List;

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController$PhoneAccountSearchListener$1;->val$accounts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController$PhoneAccountSearchListener$1;->this$1:Lru/mail/libverify/controls/VerificationController$PhoneAccountSearchListener;

    iget-object v0, v0, Lru/mail/libverify/controls/VerificationController$PhoneAccountSearchListener;->this$0:Lru/mail/libverify/controls/VerificationController;

    invoke-static {v0}, Lru/mail/libverify/controls/VerificationController;->access$200(Lru/mail/libverify/controls/VerificationController;)Lru/mail/libverify/controls/VerificationListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController$PhoneAccountSearchListener$1;->this$1:Lru/mail/libverify/controls/VerificationController$PhoneAccountSearchListener;

    iget-object v0, v0, Lru/mail/libverify/controls/VerificationController$PhoneAccountSearchListener;->this$0:Lru/mail/libverify/controls/VerificationController;

    invoke-static {v0}, Lru/mail/libverify/controls/VerificationController;->access$200(Lru/mail/libverify/controls/VerificationController;)Lru/mail/libverify/controls/VerificationListener;

    move-result-object v1

    iget-object v0, p0, Lru/mail/libverify/controls/VerificationController$PhoneAccountSearchListener$1;->val$accounts:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchItem;

    iget-object v0, v0, Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchItem;->phone:Ljava/lang/String;

    invoke-interface {v1, v0}, Lru/mail/libverify/controls/VerificationListener;->onPhoneNumberReceived(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
