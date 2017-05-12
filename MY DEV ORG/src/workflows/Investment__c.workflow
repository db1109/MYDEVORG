<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Approval_Request</fullName>
        <description>Approval Request</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Investment_Approvalrequest</template>
    </alerts>
    <alerts>
        <fullName>Approved_Email</fullName>
        <description>Approved Email</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Investment_Approved</template>
    </alerts>
    <alerts>
        <fullName>Rejection</fullName>
        <description>Rejection</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Investment_Rejection</template>
    </alerts>
</Workflow>
