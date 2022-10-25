.class final synthetic Lru/mail/libverify/api/af$3;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/af;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic a:[I

.field static final synthetic b:[I

.field static final synthetic c:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    invoke-static {}, Lru/mail/libverify/api/VerificationApi$VerificationSource;->values()[Lru/mail/libverify/api/VerificationApi$VerificationSource;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lru/mail/libverify/api/af$3;->c:[I

    :try_start_0
    sget-object v0, Lru/mail/libverify/api/af$3;->c:[I

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationSource;->APPLICATION_LOCAL:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    invoke-virtual {v1}, Lru/mail/libverify/api/VerificationApi$VerificationSource;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_1a

    :goto_0
    :try_start_1
    sget-object v0, Lru/mail/libverify/api/af$3;->c:[I

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationSource;->SMS:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    invoke-virtual {v1}, Lru/mail/libverify/api/VerificationApi$VerificationSource;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_19

    :goto_1
    :try_start_2
    sget-object v0, Lru/mail/libverify/api/af$3;->c:[I

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationSource;->CALL:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    invoke-virtual {v1}, Lru/mail/libverify/api/VerificationApi$VerificationSource;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_18

    :goto_2
    :try_start_3
    sget-object v0, Lru/mail/libverify/api/af$3;->c:[I

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationSource;->APPLICATION_EXTERNAL:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    invoke-virtual {v1}, Lru/mail/libverify/api/VerificationApi$VerificationSource;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_17

    :goto_3
    :try_start_4
    sget-object v0, Lru/mail/libverify/api/af$3;->c:[I

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationSource;->USER_INPUT:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    invoke-virtual {v1}, Lru/mail/libverify/api/VerificationApi$VerificationSource;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_16

    :goto_4
    :try_start_5
    sget-object v0, Lru/mail/libverify/api/af$3;->c:[I

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationSource;->ALREADY_VERIFIED:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    invoke-virtual {v1}, Lru/mail/libverify/api/VerificationApi$VerificationSource;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_15

    :goto_5
    :try_start_6
    sget-object v0, Lru/mail/libverify/api/af$3;->c:[I

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationSource;->UNKNOWN:Lru/mail/libverify/api/VerificationApi$VerificationSource;

    invoke-virtual {v1}, Lru/mail/libverify/api/VerificationApi$VerificationSource;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_14

    :goto_6
    invoke-static {}, Lru/mail/libverify/api/VerificationApi$VerificationState;->values()[Lru/mail/libverify/api/VerificationApi$VerificationState;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lru/mail/libverify/api/af$3;->b:[I

    :try_start_7
    sget-object v0, Lru/mail/libverify/api/af$3;->b:[I

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationState;->INITIAL:Lru/mail/libverify/api/VerificationApi$VerificationState;

    invoke-virtual {v1}, Lru/mail/libverify/api/VerificationApi$VerificationState;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_13

    :goto_7
    :try_start_8
    sget-object v0, Lru/mail/libverify/api/af$3;->b:[I

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationState;->VERIFYING_PHONE_NUMBER:Lru/mail/libverify/api/VerificationApi$VerificationState;

    invoke-virtual {v1}, Lru/mail/libverify/api/VerificationApi$VerificationState;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_12

    :goto_8
    :try_start_9
    sget-object v0, Lru/mail/libverify/api/af$3;->b:[I

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationState;->SUSPENDED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    invoke-virtual {v1}, Lru/mail/libverify/api/VerificationApi$VerificationState;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_11

    :goto_9
    :try_start_a
    sget-object v0, Lru/mail/libverify/api/af$3;->b:[I

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationState;->WAITING_FOR_SMS_CODE:Lru/mail/libverify/api/VerificationApi$VerificationState;

    invoke-virtual {v1}, Lru/mail/libverify/api/VerificationApi$VerificationState;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_10

    :goto_a
    :try_start_b
    sget-object v0, Lru/mail/libverify/api/af$3;->b:[I

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationState;->VERIFYING_SMS_CODE:Lru/mail/libverify/api/VerificationApi$VerificationState;

    invoke-virtual {v1}, Lru/mail/libverify/api/VerificationApi$VerificationState;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_f

    :goto_b
    :try_start_c
    sget-object v0, Lru/mail/libverify/api/af$3;->b:[I

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationState;->SUCCEEDED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    invoke-virtual {v1}, Lru/mail/libverify/api/VerificationApi$VerificationState;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_e

    :goto_c
    :try_start_d
    sget-object v0, Lru/mail/libverify/api/af$3;->b:[I

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationState;->FAILED:Lru/mail/libverify/api/VerificationApi$VerificationState;

    invoke-virtual {v1}, Lru/mail/libverify/api/VerificationApi$VerificationState;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_d

    :goto_d
    :try_start_e
    sget-object v0, Lru/mail/libverify/api/af$3;->b:[I

    sget-object v1, Lru/mail/libverify/api/VerificationApi$VerificationState;->FINAL:Lru/mail/libverify/api/VerificationApi$VerificationState;

    invoke-virtual {v1}, Lru/mail/libverify/api/VerificationApi$VerificationState;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_e} :catch_c

    :goto_e
    invoke-static {}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->values()[Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lru/mail/libverify/api/af$3;->a:[I

    :try_start_f
    sget-object v0, Lru/mail/libverify/api/af$3;->a:[I

    sget-object v1, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->OK:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    invoke-virtual {v1}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_f .. :try_end_f} :catch_b

    :goto_f
    :try_start_10
    sget-object v0, Lru/mail/libverify/api/af$3;->a:[I

    sget-object v1, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->VERIFIED:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    invoke-virtual {v1}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_10
    .catch Ljava/lang/NoSuchFieldError; {:try_start_10 .. :try_end_10} :catch_a

    :goto_10
    :try_start_11
    sget-object v0, Lru/mail/libverify/api/af$3;->a:[I

    sget-object v1, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->UNKNOWN:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    invoke-virtual {v1}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_11
    .catch Ljava/lang/NoSuchFieldError; {:try_start_11 .. :try_end_11} :catch_9

    :goto_11
    :try_start_12
    sget-object v0, Lru/mail/libverify/api/af$3;->a:[I

    sget-object v1, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->INCORRECT_SIGNATURE:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    invoke-virtual {v1}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_12 .. :try_end_12} :catch_8

    :goto_12
    :try_start_13
    sget-object v0, Lru/mail/libverify/api/af$3;->a:[I

    sget-object v1, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->NOT_ENOUGH_DATA:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    invoke-virtual {v1}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_13
    .catch Ljava/lang/NoSuchFieldError; {:try_start_13 .. :try_end_13} :catch_7

    :goto_13
    :try_start_14
    sget-object v0, Lru/mail/libverify/api/af$3;->a:[I

    sget-object v1, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ERROR:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    invoke-virtual {v1}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_14} :catch_6

    :goto_14
    :try_start_15
    sget-object v0, Lru/mail/libverify/api/af$3;->a:[I

    sget-object v1, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->PHONE_NUMBER_IN_BLACK_LIST:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    invoke-virtual {v1}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_15 .. :try_end_15} :catch_5

    :goto_15
    :try_start_16
    sget-object v0, Lru/mail/libverify/api/af$3;->a:[I

    sget-object v1, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->INCORRECT_PHONE_NUMBER:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    invoke-virtual {v1}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_16
    .catch Ljava/lang/NoSuchFieldError; {:try_start_16 .. :try_end_16} :catch_4

    :goto_16
    :try_start_17
    sget-object v0, Lru/mail/libverify/api/af$3;->a:[I

    sget-object v1, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->PHONE_NUMBER_TYPE_NOT_ALLOWED:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    invoke-virtual {v1}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_17
    .catch Ljava/lang/NoSuchFieldError; {:try_start_17 .. :try_end_17} :catch_3

    :goto_17
    :try_start_18
    sget-object v0, Lru/mail/libverify/api/af$3;->a:[I

    sget-object v1, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->UNSUPPORTED_NUMBER:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    invoke-virtual {v1}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_18
    .catch Ljava/lang/NoSuchFieldError; {:try_start_18 .. :try_end_18} :catch_2

    :goto_18
    :try_start_19
    sget-object v0, Lru/mail/libverify/api/af$3;->a:[I

    sget-object v1, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->RATELIMIT:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    invoke-virtual {v1}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_19
    .catch Ljava/lang/NoSuchFieldError; {:try_start_19 .. :try_end_19} :catch_1

    :goto_19
    :try_start_1a
    sget-object v0, Lru/mail/libverify/api/af$3;->a:[I

    sget-object v1, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ATTEMPTLIMIT:Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;

    invoke-virtual {v1}, Lru/mail/libverify/requests/response/ClientApiResponseBase$Status;->ordinal()I

    move-result v1

    const/16 v2, 0xc

    aput v2, v0, v1
    :try_end_1a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1a .. :try_end_1a} :catch_0

    :goto_1a
    return-void

    :catch_0
    move-exception v0

    goto :goto_1a

    :catch_1
    move-exception v0

    goto :goto_19

    :catch_2
    move-exception v0

    goto :goto_18

    :catch_3
    move-exception v0

    goto :goto_17

    :catch_4
    move-exception v0

    goto :goto_16

    :catch_5
    move-exception v0

    goto :goto_15

    :catch_6
    move-exception v0

    goto :goto_14

    :catch_7
    move-exception v0

    goto :goto_13

    :catch_8
    move-exception v0

    goto :goto_12

    :catch_9
    move-exception v0

    goto :goto_11

    :catch_a
    move-exception v0

    goto/16 :goto_10

    :catch_b
    move-exception v0

    goto/16 :goto_f

    :catch_c
    move-exception v0

    goto/16 :goto_e

    :catch_d
    move-exception v0

    goto/16 :goto_d

    :catch_e
    move-exception v0

    goto/16 :goto_c

    :catch_f
    move-exception v0

    goto/16 :goto_b

    :catch_10
    move-exception v0

    goto/16 :goto_a

    :catch_11
    move-exception v0

    goto/16 :goto_9

    :catch_12
    move-exception v0

    goto/16 :goto_8

    :catch_13
    move-exception v0

    goto/16 :goto_7

    :catch_14
    move-exception v0

    goto/16 :goto_6

    :catch_15
    move-exception v0

    goto/16 :goto_5

    :catch_16
    move-exception v0

    goto/16 :goto_4

    :catch_17
    move-exception v0

    goto/16 :goto_3

    :catch_18
    move-exception v0

    goto/16 :goto_2

    :catch_19
    move-exception v0

    goto/16 :goto_1

    :catch_1a
    move-exception v0

    goto/16 :goto_0
.end method
