.class public final enum Lru/mail/libverify/statistics/a;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lru/mail/libverify/statistics/a;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lru/mail/libverify/statistics/a;

.field public static final enum API_Request_Failure:Lru/mail/libverify/statistics/a;

.field public static final enum Check_Account_Completed:Lru/mail/libverify/statistics/a;

.field public static final enum Check_Account_Started:Lru/mail/libverify/statistics/a;

.field public static final enum Check_Application_Completed:Lru/mail/libverify/statistics/a;

.field public static final enum InitialVerification_Received:Lru/mail/libverify/statistics/a;

.field public static final enum Instance_Alien_Sms_Intercepted:Lru/mail/libverify/statistics/a;

.field public static final enum Instance_Fetcher_Started:Lru/mail/libverify/statistics/a;

.field public static final enum Instance_Fetcher_Stopped:Lru/mail/libverify/statistics/a;

.field public static final enum Instance_Reset:Lru/mail/libverify/statistics/a;

.field public static final enum Instance_Soft_SignOut:Lru/mail/libverify/statistics/a;

.field public static final enum NotificationPopup_ConfirmClicked:Lru/mail/libverify/statistics/a;

.field public static final enum NotificationPopup_Dismissed:Lru/mail/libverify/statistics/a;

.field public static final enum NotificationPopup_EqualSmsReceived:Lru/mail/libverify/statistics/a;

.field public static final enum NotificationPopup_FullScreenOpened:Lru/mail/libverify/statistics/a;

.field public static final enum NotificationPopup_SettingsOpened:Lru/mail/libverify/statistics/a;

.field public static final enum PhoneChecker_New_Check_Started:Lru/mail/libverify/statistics/a;

.field public static final enum PushNotification_Completed:Lru/mail/libverify/statistics/a;

.field public static final enum PushNotification_Duplication:Lru/mail/libverify/statistics/a;

.field public static final enum PushNotification_Received:Lru/mail/libverify/statistics/a;

.field public static final enum PushNotification_ServerCompleted:Lru/mail/libverify/statistics/a;

.field public static final enum PushNotification_StatusSubmitted:Lru/mail/libverify/statistics/a;

.field public static final enum PushToken_FailedToObtain:Lru/mail/libverify/statistics/a;

.field public static final enum PushToken_Received:Lru/mail/libverify/statistics/a;

.field public static final enum PushToken_Refresh:Lru/mail/libverify/statistics/a;

.field public static final enum PushToken_ServiceError:Lru/mail/libverify/statistics/a;

.field public static final enum Server_Api_Host_Overridden:Lru/mail/libverify/statistics/a;

.field public static final enum Server_Client_Failure:Lru/mail/libverify/statistics/a;

.field public static final enum Server_Failure:Lru/mail/libverify/statistics/a;

.field public static final enum Server_Switched_To_Next_Api_Host:Lru/mail/libverify/statistics/a;

.field public static final enum Session_Call_Info_Received:Lru/mail/libverify/statistics/a;

.field public static final enum Settings_ReportReuseClicked:Lru/mail/libverify/statistics/a;

.field public static final enum Settings_TemporaryBlockClicked:Lru/mail/libverify/statistics/a;

.field public static final enum Verification_Cancelled:Lru/mail/libverify/statistics/a;

.field public static final enum Verification_Completed:Lru/mail/libverify/statistics/a;

.field public static final enum Verification_Completed_Background:Lru/mail/libverify/statistics/a;

.field public static final enum Verification_Ivr_Requested:Lru/mail/libverify/statistics/a;

.field public static final enum Verification_NewSmsCode_Requested:Lru/mail/libverify/statistics/a;

.field public static final enum Verification_Started:Lru/mail/libverify/statistics/a;

.field public static final enum Verification_Switched_Background:Lru/mail/libverify/statistics/a;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "Verification_Started"

    invoke-direct {v0, v1, v3}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->Verification_Started:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "Verification_Completed"

    invoke-direct {v0, v1, v4}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->Verification_Completed:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "Verification_Ivr_Requested"

    invoke-direct {v0, v1, v5}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->Verification_Ivr_Requested:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "Verification_Cancelled"

    invoke-direct {v0, v1, v6}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->Verification_Cancelled:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "Verification_Completed_Background"

    invoke-direct {v0, v1, v7}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->Verification_Completed_Background:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "Verification_Switched_Background"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->Verification_Switched_Background:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "Verification_NewSmsCode_Requested"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->Verification_NewSmsCode_Requested:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "PushNotification_Received"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->PushNotification_Received:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "PushNotification_Completed"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->PushNotification_Completed:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "PushNotification_StatusSubmitted"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->PushNotification_StatusSubmitted:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "PushNotification_ServerCompleted"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->PushNotification_ServerCompleted:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "PushNotification_Duplication"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->PushNotification_Duplication:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "NotificationPopup_ConfirmClicked"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->NotificationPopup_ConfirmClicked:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "NotificationPopup_SettingsOpened"

    const/16 v2, 0xd

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->NotificationPopup_SettingsOpened:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "NotificationPopup_Dismissed"

    const/16 v2, 0xe

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->NotificationPopup_Dismissed:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "NotificationPopup_FullScreenOpened"

    const/16 v2, 0xf

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->NotificationPopup_FullScreenOpened:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "NotificationPopup_EqualSmsReceived"

    const/16 v2, 0x10

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->NotificationPopup_EqualSmsReceived:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "Settings_ReportReuseClicked"

    const/16 v2, 0x11

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->Settings_ReportReuseClicked:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "Settings_TemporaryBlockClicked"

    const/16 v2, 0x12

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->Settings_TemporaryBlockClicked:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "PushToken_Received"

    const/16 v2, 0x13

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->PushToken_Received:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "PushToken_Refresh"

    const/16 v2, 0x14

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->PushToken_Refresh:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "PushToken_FailedToObtain"

    const/16 v2, 0x15

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->PushToken_FailedToObtain:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "PushToken_ServiceError"

    const/16 v2, 0x16

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->PushToken_ServiceError:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "InitialVerification_Received"

    const/16 v2, 0x17

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->InitialVerification_Received:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "Server_Failure"

    const/16 v2, 0x18

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->Server_Failure:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "Server_Switched_To_Next_Api_Host"

    const/16 v2, 0x19

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->Server_Switched_To_Next_Api_Host:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "Server_Client_Failure"

    const/16 v2, 0x1a

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->Server_Client_Failure:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "Server_Api_Host_Overridden"

    const/16 v2, 0x1b

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->Server_Api_Host_Overridden:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "API_Request_Failure"

    const/16 v2, 0x1c

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->API_Request_Failure:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "Instance_Reset"

    const/16 v2, 0x1d

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->Instance_Reset:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "PhoneChecker_New_Check_Started"

    const/16 v2, 0x1e

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->PhoneChecker_New_Check_Started:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "Instance_Soft_SignOut"

    const/16 v2, 0x1f

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->Instance_Soft_SignOut:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "Check_Account_Started"

    const/16 v2, 0x20

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->Check_Account_Started:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "Check_Account_Completed"

    const/16 v2, 0x21

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->Check_Account_Completed:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "Check_Application_Completed"

    const/16 v2, 0x22

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->Check_Application_Completed:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "Session_Call_Info_Received"

    const/16 v2, 0x23

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->Session_Call_Info_Received:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "Instance_Fetcher_Started"

    const/16 v2, 0x24

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->Instance_Fetcher_Started:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "Instance_Fetcher_Stopped"

    const/16 v2, 0x25

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->Instance_Fetcher_Stopped:Lru/mail/libverify/statistics/a;

    new-instance v0, Lru/mail/libverify/statistics/a;

    const-string/jumbo v1, "Instance_Alien_Sms_Intercepted"

    const/16 v2, 0x26

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/statistics/a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lru/mail/libverify/statistics/a;->Instance_Alien_Sms_Intercepted:Lru/mail/libverify/statistics/a;

    const/16 v0, 0x27

    new-array v0, v0, [Lru/mail/libverify/statistics/a;

    sget-object v1, Lru/mail/libverify/statistics/a;->Verification_Started:Lru/mail/libverify/statistics/a;

    aput-object v1, v0, v3

    sget-object v1, Lru/mail/libverify/statistics/a;->Verification_Completed:Lru/mail/libverify/statistics/a;

    aput-object v1, v0, v4

    sget-object v1, Lru/mail/libverify/statistics/a;->Verification_Ivr_Requested:Lru/mail/libverify/statistics/a;

    aput-object v1, v0, v5

    sget-object v1, Lru/mail/libverify/statistics/a;->Verification_Cancelled:Lru/mail/libverify/statistics/a;

    aput-object v1, v0, v6

    sget-object v1, Lru/mail/libverify/statistics/a;->Verification_Completed_Background:Lru/mail/libverify/statistics/a;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lru/mail/libverify/statistics/a;->Verification_Switched_Background:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lru/mail/libverify/statistics/a;->Verification_NewSmsCode_Requested:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lru/mail/libverify/statistics/a;->PushNotification_Received:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lru/mail/libverify/statistics/a;->PushNotification_Completed:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lru/mail/libverify/statistics/a;->PushNotification_StatusSubmitted:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lru/mail/libverify/statistics/a;->PushNotification_ServerCompleted:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lru/mail/libverify/statistics/a;->PushNotification_Duplication:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lru/mail/libverify/statistics/a;->NotificationPopup_ConfirmClicked:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lru/mail/libverify/statistics/a;->NotificationPopup_SettingsOpened:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lru/mail/libverify/statistics/a;->NotificationPopup_Dismissed:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lru/mail/libverify/statistics/a;->NotificationPopup_FullScreenOpened:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lru/mail/libverify/statistics/a;->NotificationPopup_EqualSmsReceived:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lru/mail/libverify/statistics/a;->Settings_ReportReuseClicked:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lru/mail/libverify/statistics/a;->Settings_TemporaryBlockClicked:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x13

    sget-object v2, Lru/mail/libverify/statistics/a;->PushToken_Received:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x14

    sget-object v2, Lru/mail/libverify/statistics/a;->PushToken_Refresh:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x15

    sget-object v2, Lru/mail/libverify/statistics/a;->PushToken_FailedToObtain:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x16

    sget-object v2, Lru/mail/libverify/statistics/a;->PushToken_ServiceError:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x17

    sget-object v2, Lru/mail/libverify/statistics/a;->InitialVerification_Received:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x18

    sget-object v2, Lru/mail/libverify/statistics/a;->Server_Failure:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x19

    sget-object v2, Lru/mail/libverify/statistics/a;->Server_Switched_To_Next_Api_Host:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    sget-object v2, Lru/mail/libverify/statistics/a;->Server_Client_Failure:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    sget-object v2, Lru/mail/libverify/statistics/a;->Server_Api_Host_Overridden:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    sget-object v2, Lru/mail/libverify/statistics/a;->API_Request_Failure:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    sget-object v2, Lru/mail/libverify/statistics/a;->Instance_Reset:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    sget-object v2, Lru/mail/libverify/statistics/a;->PhoneChecker_New_Check_Started:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    sget-object v2, Lru/mail/libverify/statistics/a;->Instance_Soft_SignOut:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x20

    sget-object v2, Lru/mail/libverify/statistics/a;->Check_Account_Started:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x21

    sget-object v2, Lru/mail/libverify/statistics/a;->Check_Account_Completed:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x22

    sget-object v2, Lru/mail/libverify/statistics/a;->Check_Application_Completed:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x23

    sget-object v2, Lru/mail/libverify/statistics/a;->Session_Call_Info_Received:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x24

    sget-object v2, Lru/mail/libverify/statistics/a;->Instance_Fetcher_Started:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x25

    sget-object v2, Lru/mail/libverify/statistics/a;->Instance_Fetcher_Stopped:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    const/16 v1, 0x26

    sget-object v2, Lru/mail/libverify/statistics/a;->Instance_Alien_Sms_Intercepted:Lru/mail/libverify/statistics/a;

    aput-object v2, v0, v1

    sput-object v0, Lru/mail/libverify/statistics/a;->$VALUES:[Lru/mail/libverify/statistics/a;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lru/mail/libverify/statistics/a;
    .locals 1

    const-class v0, Lru/mail/libverify/statistics/a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/statistics/a;

    return-object v0
.end method

.method public static values()[Lru/mail/libverify/statistics/a;
    .locals 1

    sget-object v0, Lru/mail/libverify/statistics/a;->$VALUES:[Lru/mail/libverify/statistics/a;

    invoke-virtual {v0}, [Lru/mail/libverify/statistics/a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lru/mail/libverify/statistics/a;

    return-object v0
.end method
